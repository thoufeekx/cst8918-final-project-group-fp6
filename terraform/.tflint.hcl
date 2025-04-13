plugin "terraform" {
  enabled = true
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
