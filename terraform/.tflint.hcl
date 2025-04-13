plugin "terraform" {
  enabled = true
}

plugin "azurerm" {
  enabled = true
  source = "github.com/terraform-linters/tflint-ruleset-azurerm"
  version = "0.26.0"
}

rule "terraform_required_version" {
  enabled = true
}

rule "terraform_deprecated_interpolation" {
  enabled = true
}

rule "azurerm_network_security_rule_description" {
  enabled = true
}

rule "azurerm_network_security_rule_port_range" {
  enabled = true
}

rule "azurerm_network_security_rule_protocol" {
  enabled = true
}

rule "azurerm_network_security_rule_priority" {
  enabled = true
}

rule "azurerm_network_security_rule_cidr" {
  enabled = true
}

rule "azurerm_network_security_rule_access" {
  enabled = true
}

rule "azurerm_network_security_rule_direction" {
  enabled = true
}

rule "azurerm_network_security_rule_name" {
  enabled = true
}
