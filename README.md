# CST8918 Final Project - Infrastructure as Code

## Project Overview
This project implements a complete Infrastructure as Code (IaC) solution using Terraform to deploy and manage a Remix Weather Application on Azure Kubernetes Service (AKS). The infrastructure includes multiple environments (dev, test, prod) with automated deployments using GitHub Actions.

## Team Members
- [Your Name](https://github.com/yourusername)
<!-- Add other team members here -->

## Project Structure
```
.
├── .github
│   └── workflows/          # GitHub Actions workflow definitions
├── terraform
│   ├── modules            # Reusable Terraform modules
│   │   ├── backend        # Azure Blob Storage backend configuration
│   │   ├── network        # Base network infrastructure
│   │   ├── aks           # AKS cluster configuration
│   │   └── application   # Application-specific resources (ACR, Redis)
│   └── environments      # Environment-specific configurations
│       ├── dev
│       ├── test
│       └── prod
└── src                   # Application source code
```

## Features
- Multi-environment infrastructure (dev, test, prod)
- Azure Kubernetes Service (AKS) clusters
- Azure Container Registry (ACR)
- Azure Cache for Redis
- Automated CI/CD with GitHub Actions
- Infrastructure testing and validation

## Prerequisites
- Azure CLI
- Terraform
- kubectl
- Docker

## Getting Started
1. Clone this repository
2. Configure Azure credentials
3. Initialize Terraform
4. Follow environment-specific deployment instructions

## Infrastructure Components
- Virtual Network (10.0.0.0/14)
  - Prod subnet: 10.0.0.0/16
  - Test subnet: 10.1.0.0/16
  - Dev subnet: 10.2.0.0/16
  - Admin subnet: 10.3.0.0/16
- AKS Clusters
  - Test: 1 node (Standard B2s)
  - Prod: 1-3 nodes (Standard B2s)
- Azure Container Registry
- Azure Cache for Redis

## Contributing
1. Create a new branch for your feature
2. Make your changes
3. Submit a pull request
4. Ensure all checks pass
5. Get approval from a team member

## License
[Add your license here]
