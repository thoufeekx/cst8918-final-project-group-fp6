#!/bin/bash

# Import resource group
terraform import module.network.azurerm_resource_group.network /subscriptions/***/resourceGroups/cst8918-final-project-group-fp6

# Import network security group
terraform import module.network.azurerm_network_security_group.aks /subscriptions/***/resourceGroups/cst8918-final-project-group-fp6/providers/Microsoft.Network/networkSecurityGroups/fp6-vnet-nsg
