resource "azurerm_resource_group" "network" {
  name     = "fp6-network-rg"
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  name                = "fp6-vnet"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  address_space       = [var.vnet_cidr]

  tags = {
    environment = var.environment
    project     = "fp6"
  }
}

# Production subnet
resource "azurerm_subnet" "prod" {
  name                 = "fp6-prod-subnet"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.0.0/16"]
}

# Test subnet
resource "azurerm_subnet" "test" {
  name                 = "fp6-test-subnet"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.1.0.0/16"]
}

# Dev subnet
resource "azurerm_subnet" "dev" {
  name                 = "fp6-dev-subnet"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.2.0.0/16"]
}

# Admin subnet
resource "azurerm_subnet" "admin" {
  name                 = "fp6-admin-subnet"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.3.0.0/16"]
}

# Network Security Group for AKS
resource "azurerm_network_security_group" "aks" {
  name                = "fp6-aks-nsg"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name

  security_rule {
    name                       = "allow-aks-outbound"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow-aks-inbound"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = var.allowed_cidr
    destination_address_prefix = "*"
  }

  tags = {
    environment = var.environment
    project     = "fp6"
  }
}
