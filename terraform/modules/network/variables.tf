variable "resource_group_name" {
  type        = string
  description = "Name of the resource group for network resources"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "vnet_cidr" {
  description = "CIDR range for the virtual network"
  type        = string
  default     = "10.0.0.0/14" # As per requirements
}

variable "allowed_cidr" {
  description = "CIDR range allowed to access the AKS cluster"
  type        = string
  default     = "0.0.0.0/0"
}

variable "environment" {
  description = "Environment name (dev, test, prod)"
  type        = string
  default     = "dev"
}
