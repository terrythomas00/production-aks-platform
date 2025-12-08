# Monitoring Setup

## Overview

This cluster uses the Prometheus Operator stack for comprehensive monitoring:
- **Prometheus:** Metrics collection and storage
- **Grafana:** Visualization and dashboards  
- **Alertmanager:** Alert handling (configured but no alerts yet)

## Access Grafana
```bash
kubectl port-forward -n monitoring svc/prometheus-grafana 3000:80
```

Open browser: http://localhost:3000

**Credentials:**
- Username: `admin`
- Password: `admin123`

## Pre-installed Dashboards

1. **Kubernetes / Compute Resources / Cluster** - Overall cluster metrics
2. **Kubernetes / Compute Resources / Node** - Per-node metrics
3. **Kubernetes / Compute Resources / Pod** - Pod-level metrics

## Key Metrics Monitored

- CPU usage (cluster, node, pod level)
- Memory usage and limits
- Network I/O
- Disk usage
- Pod restarts
- API server metrics

## Retention

Metrics are retained for 7 days by default.
