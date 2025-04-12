variable "resource_group_name" {
  type        = string
  description = "Name of the resource group for network resources"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
  default     = "eastus"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "vnet_cidr" {
  type        = string
  description = "CIDR block for the virtual network"
  default     = "10.0.0.0/14" # As per requirements
}

variable "allowed_cidr" {
  description = "CIDR range allowed to access the AKS cluster"
  type        = string
  default     = "0.0.0.0/0"
}
