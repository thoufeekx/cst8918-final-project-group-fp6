# CST8918 Final Project - FP 6

## Team Members

- [Thoufeek](https://github.com/thoufeekx)

## Project Overview

This project implements Infrastructure as Code (IaC) using Terraform to deploy the Remix Weather Application on Azure Kubernetes Service (AKS). The infrastructure includes:

- Azure Container Registry (ACR)
- Azure Kubernetes Service (AKS) clusters for test and production environments
- Azure Cache for Redis for caching weather data
- Network infrastructure with proper segmentation

## Infrastructure Components

### Network Infrastructure
- Resource Group: `fp6-network-rg`
- Virtual Network with IP address space: 10.0.0.0/14
- Subnets:
  - prod: 10.0.0.0/16
  - test: 10.1.0.0/16
  - dev: 10.2.0.0/16
  - admin: 10.3.0.0/16

### Kubernetes Clusters
- Test Environment: 1 node AKS cluster
- Production Environment: 1-3 node AKS cluster

## Application Deployment

The Remix Weather Application is deployed to both test and production environments. The application is accessible at:
- Test Environment: http://74.179.242.115/

## GitHub Actions Workflows

The project includes several automated workflows:
- Terraform static code analysis
- Terraform plan and validation
- Terraform apply
- Docker image building and pushing
- Application deployment to test/prod environments

## Screenshots

![GitHub Actions Workflows](screenshots/workflows.png)

## Clean Up

After submission, please delete all Azure resources to avoid additional charges.

## Access Instructions

1. The application is deployed to Azure Kubernetes Service
2. Access the application at http://74.179.242.115/
3. View the weather data for Algonquin College, Woodroffe Campus
