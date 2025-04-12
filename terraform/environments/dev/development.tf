variable "dev_mode" {
  description = "Enable development mode with more permissive security settings"
  type        = bool
  default     = true
}

locals {
  # Development-specific security settings
  dev_api_access = var.dev_mode
  dev_network_rules = var.dev_mode
}

# Override API access settings for development
resource "azurerm_kubernetes_cluster" "aks" {
  api_server_authorized_ip_ranges = local.dev_api_access ? ["0.0.0.0/0"] : var.api_server_authorized_ip_ranges
}

# Override network security rules for development
resource "azurerm_network_security_group" "aks" {
  security_rule {
    name                       = "dev-allow-all-outbound"
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
    name                       = "dev-allow-all-inbound"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "0.0.0.0/0"
    destination_address_prefix = "*"
  }
}
