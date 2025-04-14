# CST8918 Final Project - Azure Infrastructure with Terraform

## Final Report: Phases 1-3 Implementation

## Project Overview
This project implements a comprehensive cloud infrastructure on Microsoft Azure using Terraform and GitHub Actions for CI/CD. The infrastructure follows a multi-environment approach with proper networking, security, and application deployment pipelines to support a Kubernetes-based application architecture.

## Team Members
- Akhil Jose
- Thoufeek

## Implementation Status

### Phase 1: Initial Setup and Repository Configuration

#### Completed Tasks
- **Basic Project Structure**: Created a well-organized directory structure with separate modules for each infrastructure component.
- **README Documentation**: Initial documentation created to describe the project.
- **.gitignore Configuration**: Set up to exclude local Terraform state files, .terraform directories, and other temporary files.
- **Terraform Provider Configuration**: Configured Azure provider with appropriate version constraints.

```hcl
# terraform/provider.tf
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
  required_version = ">= 1.0"
}
```

#### In Progress Tasks
- **GitHub Repository Settings**: 
  - Team members and professor collaboration setup
  - Branch protection rules configuration
  - PR review requirements implementation

#### Technical Details
- The project uses Terraform v1.0+ with the Azure provider v3.0+
- The repository structure follows infrastructure-as-code best practices with modular components
- Initial CI/CD pipeline setup with GitHub Actions for Terraform validation

```yaml
# .github/workflows/terraform-validate.yml
name: Terraform Validation

on:
  push:
    branches: [ '*' ]
  pull_request:
    branches: [ main ]

jobs:
  validate:
    runs-on: ubuntu-latest
    environment: production
    
    steps:
    - uses: actions/checkout@v4
    - name: Setup Terraform
      uses: hashicorp/setup-terraform@v2
    # Additional steps for validation and linting
```

### Phase 2: Backend Infrastructure

#### Completed Tasks
- **Backend Module Structure**: Created a reusable module for Azure Storage backend configuration.

#### In Progress Tasks
- **Azure Blob Storage Backend**: Configuration of storage account and container for Terraform state.
- **Backend Testing**: Validation of state storage and locking mechanisms.
- **Documentation**: Comprehensive documentation of the backend setup process.

#### Technical Details
- The backend setup uses a dedicated Terraform configuration in `terraform/backend-setup/`
- Storage account name uses a random suffix to ensure global uniqueness
- State files are stored in a private container with versioning enabled

```hcl
# terraform/backend-setup/main.tf
module "backend" {
  source = "../modules/backend"

  resource_group_name  = "tfstate-fp6-rg"
  storage_account_name = "tfstate${random_string.suffix.result}"
  container_name       = "tfstate"
  location             = "eastus"
}
```

- The backend setup provides convenient output for initializing the main Terraform configuration:

```hcl
# terraform/backend-setup/outputs.tf
output "backend_init_cli" {
  value = <<EOF
terraform init \
  -backend-config="resource_group_name=${module.backend.resource_group_name}" \
  -backend-config="storage_account_name=${module.backend.storage_account_name}" \
  -backend-config="container_name=${module.backend.container_name}" \
  -backend-config="key=terraform.tfstate"
EOF
}
```

### Phase 3: Network Infrastructure

#### Completed Tasks
- **Network Module**: Created a reusable module for Azure networking resources.

#### In Progress Tasks
- **VNet and Subnet Configuration**: 
  - VNet with CIDR range 10.0.0.0/14
  - Production subnet (10.0.0.0/16)
  - Test subnet (10.1.0.0/16)
  - Development subnet (10.2.0.0/16)
  - Admin subnet (10.3.0.0/16)
- **Network Security Groups**: Configuration of NSGs for secure access control.
- **Network Peering**: Configuration of network peering if needed.

#### Technical Details
- The network module creates a resource group dedicated to networking resources
- Virtual network is configured with a large address space to accommodate multiple environments
- Each environment has its own subnet with proper address space allocation
- Network security groups are configured with appropriate inbound and outbound rules

```hcl
# terraform/modules/network/main.tf (partial)
resource "azurerm_virtual_network" "main" {
  name                = "fp6-vnet"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  address_space       = [var.vnet_cidr]  # 10.0.0.0/14
}

# Production subnet
resource "azurerm_subnet" "prod" {
  name                 = "fp6-prod-subnet"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.0.0/16"]
}
```

## Challenges and Solutions

### Challenge 1: Backend State Management
**Challenge**: Setting up a secure and reliable backend for Terraform state management.

**Solution**: Created a dedicated module for backend setup with proper security configurations and versioning enabled. The module outputs a ready-to-use initialization command to simplify the setup process.

### Challenge 2: Network Segmentation
**Challenge**: Designing a network architecture that properly isolates different environments while allowing necessary communication.

**Solution**: Implemented a hierarchical network design with a large VNet and separate subnets for each environment. Network security groups are configured to control traffic between subnets.

### Challenge 3: CI/CD Pipeline Integration
**Challenge**: Setting up a CI/CD pipeline that validates Terraform configurations without requiring credentials for every push.

**Solution**: Implemented a two-stage approach with:
1. Validation workflow that runs on every push without backend initialization
2. Plan and apply workflows that run only on PRs and merges to main branch

## Next Steps

1. **Complete Phase 2**: Finalize the Azure Blob Storage backend configuration and documentation.
2. **Complete Phase 3**: Finish the network infrastructure implementation with all subnets and security groups.
3. **Prepare for Phase 4**: Begin setting up the AKS infrastructure for test and production environments.

## Setup Instructions

### Prerequisites
- Azure CLI installed and configured
- Terraform CLI (v1.0+) installed
- GitHub account with access to the repository

### Initial Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/thoufeekx/cst8918-final-project-group-fp6.git
   cd cst8918-final-project-group-fp6
   ```

2. Set up the Terraform backend:
   ```bash
   cd terraform/backend-setup
   terraform init
   terraform apply
   ```

3. Note the backend configuration output and use it to initialize the main Terraform configuration:
   ```bash
   cd ../
   # Use the command from the backend setup output
   terraform init \
     -backend-config="resource_group_name=<RESOURCE_GROUP_NAME>" \
     -backend-config="storage_account_name=<STORAGE_ACCOUNT_NAME>" \
     -backend-config="container_name=<CONTAINER_NAME>" \
     -backend-config="key=terraform.tfstate"
   ```

4. Deploy the network infrastructure:
   ```bash
   terraform apply -target=module.network
   ```

## Conclusion
Phases 1-3 of the project have established a solid foundation for the Azure infrastructure. The initial setup, backend configuration, and network infrastructure provide the groundwork for the Kubernetes clusters and application deployment in subsequent phases. The modular approach ensures scalability and maintainability as the project progresses.

---

**Status Legend**
- ✅ = Completed
- 🚧 = In Progress
- ❌ = Not Started

**Current Focus**: Completing Phase 2 (Backend Infrastructure) and Phase 3 (Network Infrastructure)
