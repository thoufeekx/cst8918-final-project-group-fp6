variable "dev_mode" {
  description = "Enable development mode with more permissive security settings group 6"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "Name of the AKS : CST8918 cluster"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "api_server_authorized_ip_ranges" {
  description = "List of IP ranges allowed to access the API server"
  type        = list(string)
  default     = []
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "allowed_cidr" {
  description = "CIDR range for allowed network access"
  type        = string
  default     = ""
}

locals {
  # Development-specific security settings
  dev_api_access    = var.dev_mode
  dev_network_rules = var.dev_mode
}

module "aks" {
  source = "../modules/aks"

  cluster_name        = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name

  # Development-specific overrides
  api_server_authorized_ip_ranges = local.dev_api_access ? ["0.0.0.0/0"] : var.api_server_authorized_ip_ranges
}

module "network" {
  source = "../modules/network"

  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name

  # Development-specific overrides
  allowed_cidr = local.dev_network_rules ? "0.0.0.0/0" : var.allowed_cidr
}
