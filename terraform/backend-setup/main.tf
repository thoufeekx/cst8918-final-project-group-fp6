module "backend" {
  source = "../modules/backend"

  resource_group_name  = "tfstate-fp6-rg"
  storage_account_name = "tfstate${random_string.suffix.result}"
  container_name      = "tfstate"
  location            = "eastus"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}
