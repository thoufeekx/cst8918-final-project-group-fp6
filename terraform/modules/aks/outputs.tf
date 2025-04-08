output "cluster_id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "ID of the AKS cluster"
}

output "kube_config" {
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  description = "Raw kubeconfig for the AKS cluster"
  sensitive   = true
}

output "cluster_name" {
  value       = azurerm_kubernetes_cluster.aks.name
  description = "Name of the AKS cluster"
}

output "cluster_fqdn" {
  value       = azurerm_kubernetes_cluster.aks.fqdn
  description = "FQDN of the AKS cluster"
}
