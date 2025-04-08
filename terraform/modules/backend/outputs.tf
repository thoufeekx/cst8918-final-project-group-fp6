output "storage_account_name" {
  value = azurerm_storage_account.terraform_state.name
}

output "container_name" {
  value = azurerm_storage_container.terraform_state.name
}

output "resource_group_name" {
  value = azurerm_resource_group.backend.name
}
