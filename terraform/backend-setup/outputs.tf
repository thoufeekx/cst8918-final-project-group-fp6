output "backend_config" {
  value = {
    resource_group_name  = module.backend.resource_group_name
    storage_account_name = module.backend.storage_account_name
    container_name       = module.backend.container_name
  }
  description = "Backend configuration values"
}

output "backend_init_cli" {
  value       = <<EOF
terraform init \
  -backend-config="resource_group_name=${module.backend.resource_group_name}" \
  -backend-config="storage_account_name=${module.backend.storage_account_name}" \
  -backend-config="container_name=${module.backend.container_name}" \
  -backend-config="key=terraform.tfstate"
EOF
  description = "Command to initialize Terraform backend"
}
