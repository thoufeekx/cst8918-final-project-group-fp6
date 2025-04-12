variable "dev_mode" {
  description = "Enable development mode with more permissive security settings"
  type        = bool
  default     = true
}

variable "cluster_name" {
}

variable "location" {
}

variable "resource_group_name" {
}

variable "api_server_authorized_ip_ranges" {
  default = []
}

variable "vnet_name" {
}

variable "allowed_cidr" {
  default = ""
}

locals {
  # Development-specific security settings
  dev_api_access    = var.dev_mode
  dev_network_rules = var.dev_mode
}

module "aks" {
  source = "../modules/aks"
  
  cluster_name = var.cluster_name
  location     = var.location
  resource_group_name = var.resource_group_name
  
  # Development-specific overrides
  api_server_authorized_ip_ranges = local.dev_api_access ? ["0.0.0.0/0"] : var.api_server_authorized_ip_ranges
}

module "network" {
  source = "../modules/network"
  
  vnet_name = var.vnet_name
  location  = var.location
  resource_group_name = var.resource_group_name
  
  # Development-specific overrides
  allowed_cidr = local.dev_network_rules ? "0.0.0.0/0" : var.allowed_cidr
}
