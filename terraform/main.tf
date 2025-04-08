module "network" {
  source = "./modules/network"

  resource_group_name = "cst8918-final-project-group-fp6"
  vnet_name          = "fp6-vnet"
  location           = "eastus"
}

module "acr" {
  source = "./modules/acr"

  acr_name            = "fp6acr"
  resource_group_name = module.network.resource_group_name
  location           = "eastus"
}

module "aks_test" {
  source = "./modules/aks"

  cluster_name        = "fp6-aks-test"
  resource_group_name = module.network.resource_group_name
  location           = "eastus"
  environment        = "test"
  node_count         = 1
  enable_auto_scaling = false
  subnet_id          = module.network.test_subnet_id
  acr_id             = module.acr.acr_id
}

module "aks_prod" {
  source = "./modules/aks"

  cluster_name        = "fp6-aks-prod"
  resource_group_name = module.network.resource_group_name
  location           = "eastus"
  environment        = "prod"
  node_count         = 1
  min_node_count     = 1
  max_node_count     = 3
  enable_auto_scaling = true
  subnet_id          = module.network.prod_subnet_id
  acr_id             = module.acr.acr_id
}
