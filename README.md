# Production-Ready AKS Platform

A production-grade Azure Kubernetes Service cluster demonstrating DevOps and cloud engineering best practices.

## 🎯 Project Status

**Phase 1:** ✅ Basic cluster deployed  
**Phase 2:** 🔄 In progress  
**Phase 3:** ⏳ Planned  

## 🛠️ Technologies

- **Cloud Platform:** Microsoft Azure
- **Container Orchestration:** Kubernetes (AKS)
- **Infrastructure as Code:** Terraform
- **Monitoring:** Prometheus & Grafana (coming soon)

## 📋 Architecture

Current setup:
- 2-node Kubernetes cluster
- Azure-managed control plane
- System-assigned managed identity
- East US region

  ### Monitoring Stack
- Prometheus for metrics collection
- Grafana for visualization
- 7-day retention period
- Pre-configured dashboards

[View monitoring documentation](docs/monitoring.md)

## 🚀 Deployment

### Prerequisites
- Azure CLI installed and authenticated
- Terraform >= 1.0 installed
- kubectl installed

### Deploy
```bash
# Login to Azure
az login

# Deploy infrastructure
terraform init
terraform plan
terraform apply

# Configure kubectl
az aks get-credentials --resource-group aks-production-rg --name production-aks-cluster

# Verify cluster
kubectl get nodes
```

## 📖 Learning Objectives

This project demonstrates:
- Infrastructure as Code with Terraform
- Azure Kubernetes Service management
- Cloud security best practices
- Container orchestration
- Production-ready architecture

## 👤 Author

**Terry Thomas**  
DevOps Engineer | Cloud Infrastructure | Azure Certified

📧 terry.thomas00@gmail.com  
💼 [LinkedIn](your-linkedin-url)  
🐙 [GitHub](https://github.com/terrythomas00)

---

*This project is part of my continuous learning journey in DevOps and cloud engineering.*
