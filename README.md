
# CST8918 Final Project Report  
## Infrastructure as Code (IaC) Implementation for Remix Weather Application

### Team Members  
- Thoufeek Baber [041166788]  
- Akhil Jose [041171055]  
- Stefeena Vellachanil Benny [041154501]  
- Shiva Reddy [041146928]

---

## Screenshots

- **Deployed Website Screenshot**  
  ![Deployed Website](images/1.png)  
- **Workflow Runs (Success)**  
  ![Workflow Runs](images/2.png)  
- **Workflow Validation**  
  ![Workflow Validate](images/3.png)  
- **Workflow Apply**  
  ![Workflow Apply](images/4.png)  
- **Deployment Workflow**  
  ![Workflow Deploy](images/5.png)

---

## Table of Contents  
1. Introduction  
2. Project Overview  
3. Methodology  
4. Implementation  
5. Results and Analysis  
6. Conclusion  

---

## 1. Introduction  
This comprehensive report documents the successful implementation of an Infrastructure as Code (IaC) solution for deploying the Remix Weather Application on Azure Kubernetes Service (AKS). The project aimed to create a scalable, secure, and fully automated infrastructure for weather data visualization. Adhering to cloud-native best practices, the solution meets enterprise-grade standards for reliability, security, and performance.

### 1.1 Project Objectives  
- Fully automated infrastructure deployment using Terraform  
- Scalable and secure Kubernetes environment  
- Robust CI/CD pipeline with GitHub Actions  
- High availability and optimized performance  
- Comprehensive monitoring and logging setup

### 1.2 Scope  
- Infrastructure design and provisioning  
- Application deployment and containerization  
- Security controls and vulnerability mitigation  
- Documentation and maintainability planning

---

## 2. Project Overview  
The project was divided into eight distinct phases to manage complexity and ensure systematic delivery of each component.

### 2.1 Project Phases  
1. Requirements and Planning  
2. Infrastructure Design  
3. Terraform Module Development  
4. Azure Kubernetes Service Setup  
5. Application Infrastructure Deployment  
6. CI/CD Pipeline Implementation  
7. Testing and Documentation  
8. Final Review and Submission

### 2.2 Technical Stack  
- **IaC Tool**: Terraform  
- **Container Platform**: Azure Kubernetes Service (AKS)  
- **Image Registry**: Azure Container Registry (ACR)  
- **Caching**: Azure Cache for Redis  
- **CI/CD**: GitHub Actions

---

## 3. Methodology  

### 3.1 Planning Phase  
- Gathered functional and technical requirements  
- Designed scalable and secure network and cluster architecture  
- Performed cost estimation and workload analysis  
- Identified environment-specific needs for dev, test, and prod

### 3.2 Implementation Strategy  
- Infrastructure-first approach (IaC before app deployment)  
- Modular Terraform code for reusability  
- Configurations tailored for each environment  
- Security-by-design and continuous validation

### 3.3 Testing Methodology  
- Infrastructure tests for resource provisioning  
- Kubernetes readiness checks  
- Security audits (role-based access, image pull policies)  
- CI pipeline linting, syntax validation, and deployment dry-runs

---

## 4. Implementation  

### 4.1 Network Infrastructure  
- **Resource Group**: `fp6-network-rg`  
- **VNet Address Space**: `10.0.0.0/14`  
- **Subnets**:  
  - prod: `10.0.0.0/16`  
  - test: `10.1.0.0/16`  
  - dev: `10.2.0.0/16`  
  - admin: `10.3.0.0/16`

### 4.2 Kubernetes Clusters  
- **Test Cluster**:  
  - 1 node, Standard B2s, K8s v1.32  
- **Production Cluster**:  
  - 1–3 nodes with autoscaling, Standard B2s, K8s v1.32

### 4.3 Azure Container Registry (ACR)  
- Central ACR to store and manage Docker images  
- Integrated with AKS using managed identity and RBAC  

---

## 5. Application Infrastructure  

### 5.1 Redis Caching  
- Test: Basic-tier Redis  
- Production: High availability Redis with advanced configs

### 5.2 Kubernetes Configuration  
- Deployments for frontend and backend (Remix Weather App)  
- Services: ClusterIP and LoadBalancer  
- ConfigMaps and Secrets for environment-specific values

---

## 6. CI/CD Pipeline (GitHub Actions)  

### 6.1 Validation  
- Validates Terraform syntax and formatting  
✅ Status: Completed

### 6.2 Federated Identity  
- Azure AD applications for GitHub OIDC authentication  
- Assigned roles: Contributor (write), Reader (read)

### 6.3 Workflows  
- **Static Code Analysis**: Triggered on push  
- **Terraform Plan & Linting**: On PR to `main`  
- **Terraform Apply**: On merge to `main`  
- **Docker Build & Push**: On app code changes  
- **Test Deployment**: On PR for validation  
- **Production Deployment**: On merge to main  

---



## 8. Conclusion  
The project successfully demonstrated the end-to-end implementation of an enterprise-grade IaC solution using Terraform for AKS on Azure. The solution ensures security, scalability, and automation while following best practices in CI/CD and cloud-native development.

---
