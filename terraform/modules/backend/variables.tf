variable "resource_group_name" {
  type        = string
  description = "Name of the resource group for Terraform backend"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account for Terraform backend"
}

variable "container_name" {
  type        = string
  description = "Name of the storage container for Terraform state"
  default     = "tfstate"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
  default     = "eastus"
}
