resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix         = var.cluster_name
  kubernetes_version = "1.32"

  default_node_pool {
    name                = "default"
    node_count          = var.node_count
    min_count          = var.min_node_count
    max_count          = var.max_node_count
    vm_size            = "Standard_B2s"
    enable_auto_scaling = var.enable_auto_scaling
    vnet_subnet_id     = var.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  role_based_access_control_enabled = true

  tags = {
    environment = var.environment
    project     = "cst8918-final"
  }
}

# Grant AKS access to ACR
resource "azurerm_role_assignment" "aks_acr" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name            = "AcrPull"
  scope                           = var.acr_id
  skip_service_principal_aad_check = true
}
