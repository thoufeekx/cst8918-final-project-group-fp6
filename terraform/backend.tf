terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-fp6-rg"
    storage_account_name = "tfstatepbo79qfk"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
