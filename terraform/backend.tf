terraform {
  backend "azurerm" {
    # These values must be configured during initialization
    # resource_group_name  = "tfstate-rg"
    # storage_account_name = "tfstate<unique_suffix>"
    # container_name       = "tfstate"
    # key                 = "terraform.tfstate"
  }
}
