output "vnet_id" {
  value       = azurerm_virtual_network.main.id
  description = "ID of the created virtual network"
}

output "prod_subnet_id" {
  value       = azurerm_subnet.prod.id
  description = "ID of the production subnet"
}

output "test_subnet_id" {
  value       = azurerm_subnet.test.id
  description = "ID of the test subnet"
}

output "dev_subnet_id" {
  value       = azurerm_subnet.dev.id
  description = "ID of the development subnet"
}

output "admin_subnet_id" {
  value       = azurerm_subnet.admin.id
  description = "ID of the admin subnet"
}

output "nsg_id" {
  value       = azurerm_network_security_group.aks.id
  description = "ID of the AKS network security group"
}
