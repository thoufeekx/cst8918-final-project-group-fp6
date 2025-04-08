# Terraform Backend Setup

This directory contains the configuration to set up the Azure Storage Account that will be used as the Terraform backend for storing state files.

## Prerequisites

1. Azure CLI installed and logged in
2. Terraform installed
3. Appropriate Azure permissions to create resources

## Setup Steps

1. Initialize Terraform:
```bash
terraform init
```

2. Apply the configuration:
```bash
terraform apply
```

3. After successful application, you'll get the backend configuration values and a ready-to-use terraform init command.

4. Use the provided terraform init command in the main Terraform configuration directory to initialize the backend.

## Security Notes

- The storage account name will have a random suffix to ensure uniqueness
- The storage container is set to private access
- Make sure to store the backend configuration securely
- Consider using Azure Key Vault for sensitive values

## Maintenance

- Periodically review and rotate access keys
- Monitor storage account metrics
- Consider enabling soft delete for blob storage
