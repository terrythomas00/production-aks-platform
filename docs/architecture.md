# Architecture Overview

## Components

### Azure Resources
- **Resource Group:** aks-production-rg
- **AKS Cluster:** production-aks-cluster
  - 2 nodes (Standard_D2s_v3)
  - System-assigned managed identity
  - Kubernetes 1.28

### Kubernetes Workloads

**Frontend Application**
- 3 replicas
- Nginx (alpine)
- LoadBalancer service
- Public internet access

**Backend Application**
- 2 replicas  
- HTTP Echo server
- ClusterIP service (internal only)
- Accessible only from frontend

**Monitoring**
- Prometheus (metrics collection)
- Grafana (visualization)
- Deployed in `monitoring` namespace

## Network Flow
```
Internet → Azure LoadBalancer → Frontend Pods → Backend Pods
                                      ↓
                                 Prometheus ← Metrics
                                      ↓
                                  Grafana ← Dashboards
```

## Security

- Managed identity (no service principals)
- Backend not exposed to internet
- Resource limits on all pods
- RBAC enabled by default

## Cost Estimate

**Monthly Cost (approximate):**
- 2 × Standard_D2s_v3 nodes: ~$140/month
- Load Balancer: ~$20/month
- Storage: ~$5/month

**Total: ~$165/month**

