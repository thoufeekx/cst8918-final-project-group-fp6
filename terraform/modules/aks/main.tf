resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.cluster_name
  kubernetes_version  = "1.32"

  default_node_pool {
    name                = "default"
    node_count          = 1
    vm_size             = "Standard_B2s"  # Changed to meet minimum requirements
    vnet_subnet_id      = var.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    network_policy    = "azure"
    service_cidr      = "172.16.0.0/16"
    dns_service_ip    = "172.16.0.10"
  }

  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges

  role_based_access_control_enabled = true

  tags = {
    environment = var.environment
    project     = "fp6"
  }
}

# Grant ACR pull access to the AKS identity
resource "azurerm_role_assignment" "aks_acr" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}
