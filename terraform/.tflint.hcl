plugin "terraform" {
  enabled = true
}

plugin "azurerm" {
  enabled = true
  source = "github.com/terraform-linters/tflint-ruleset-azurerm"
  version = "0.26.0"
}

# Core Terraform rules
rule "terraform_required_version" {
  enabled = true
}

rule "terraform_deprecated_interpolation" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}

# AzureRM rules
rule "azurerm_name" {
  enabled = true
}

rule "azurerm_location" {
  enabled = true
}

rule "azurerm_tags" {
  enabled = true
}

rule "azurerm_resource_group" {
  enabled = true
}

rule "azurerm_security_group_rule" {
  enabled = true
}

rule "azurerm_network_security_group" {
  enabled = true
}
