variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
  default     = "eastus"
}

variable "environment" {
  type        = string
  description = "Environment (prod, test, dev)"
}

variable "node_count" {
  type        = number
  description = "Initial number of nodes in the node pool"
  default     = 1
}

variable "min_node_count" {
  type        = number
  description = "Minimum number of nodes in the node pool"
  default     = 1
}

variable "max_node_count" {
  type        = number
  description = "Maximum number of nodes in the node pool"
  default     = 1
}

variable "enable_auto_scaling" {
  type        = bool
  description = "Enable node pool autoscaling"
  default     = false
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet where the AKS cluster will be deployed"
}

variable "acr_id" {
  type        = string
  description = "ID of the Azure Container Registry"
}

variable "api_server_authorized_ip_ranges" {
  description = "List of IP ranges that are allowed to access the Kubernetes API server"
  type        = list(string)
  default     = []
}
