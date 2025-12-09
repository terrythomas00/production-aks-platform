# Deployment Guide

## Prerequisites

1. **Azure Account**
   - Active subscription
   - Free trial works fine

2. **Tools Installed**
```bash
   # Azure CLI
   az version
   
   # Terraform
   terraform version
   
   # kubectl
   kubectl version --client
   
   # Helm
   helm version
```

3. **Authentication**
```bash
   az login
   az account show
```

## Step-by-Step Deployment

### 1. Clone Repository
```bash
git clone https://github.com/terrythomas00/production-aks-platform.git
cd production-aks-platform
```

### 2. Deploy Infrastructure
```bash
terraform init
terraform plan
terraform apply
```

Wait 8-10 minutes for cluster creation.

### 3. Configure kubectl
```bash
az aks get-credentials --resource-group aks-production-rg --name production-aks-cluster
kubectl get nodes
```

### 4. Deploy Applications
```bash
kubectl apply -f kubernetes/apps/frontend.yaml
kubectl apply -f kubernetes/apps/backend.yaml

# Wait for LoadBalancer IP
kubectl get service frontend --watch
```

### 5. Install Monitoring
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

kubectl create namespace monitoring

helm install prometheus prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --set grafana.adminPassword=admin123
```

### 6. Verify Everything
```bash
./scripts/check-cluster.sh
```

### 7. Access Grafana
```bash
kubectl port-forward -n monitoring svc/prometheus-grafana 3000:80
```

Open: http://localhost:3000 (admin/admin123)

## Cleanup

To delete all resources:
```bash
./scripts/cleanup.sh
```

Or manually:
```bash
terraform destroy
