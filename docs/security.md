# Security Configuration

## Network Policies

### Default Deny-All
A baseline policy that denies all ingress and egress traffic by default.
```bash
kubectl get networkpolicy deny-all
```

### Allow Frontend
Permits:
- Ingress traffic on port 80 from any pod
- Egress traffic to backend on port 5678
- DNS lookups (UDP port 53)

### Allow Backend  
Permits:
- Ingress traffic on port 5678 from frontend only
- DNS lookups (UDP port 53)

## Resource Quotas

Limits for the default namespace:
- CPU requests: 2 cores
- Memory requests: 4Gi
- CPU limits: 4 cores
- Memory limits: 8Gi
- Max pods: 10

## Security Best Practices Implemented

**Network Segmentation**
- Default deny-all policy
- Explicit allow rules for required traffic
- Backend not accessible from internet

**Resource Limits**
- All pods have resource requests and limits
- Namespace quotas prevent resource exhaustion

**Managed Identity**
- System-assigned managed identity (no service principals)
- Automatic credential management

**RBAC**
- Enabled by default on AKS
- Kubernetes role-based access control

## Testing Network Policies
```bash
# Frontend should be accessible from internet
curl http://<EXTERNAL-IP>

# Backend should only be accessible from frontend pods
# (not from internet directly)
```

## Future Security Enhancements

Potential additions for production:
- Azure Key Vault integration for secrets
- Pod Security Standards (restricted mode)
- Image scanning policies
- Private AKS cluster
- Azure Policy for Kubernetes
- Certificate management with cert-manager
