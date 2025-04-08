module "network" {
  source = "./modules/network"

  resource_group_name = "cst8918-final-project-group-fp6"
  vnet_name          = "fp6-vnet"
  location           = "eastus"
}
