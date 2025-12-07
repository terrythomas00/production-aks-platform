#!/bin/bash
# Quick cluster health check

echo "=== Cluster Nodes ==="
kubectl get nodes

echo ""
echo "=== Running Pods ==="
kubectl get pods

echo ""
echo "=== Services ==="
kubectl get services

echo ""
echo "=== Frontend URL ==="
FRONTEND_IP=$(kubectl get service frontend -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
echo "http://$FRONTEND_IP"
