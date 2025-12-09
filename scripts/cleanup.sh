#!/bin/bash
# Cleanup script - destroys all resources

echo "WARNING: This will destroy all resources!"
echo ""
read -p "Are you sure? (type 'yes' to confirm): " confirm

if [ "$confirm" != "yes" ]; then
    echo "Cleanup cancelled"
    exit 0
fi

echo ""
echo "Deleting applications..."
kubectl delete -f kubernetes/apps/frontend.yaml
kubectl delete -f kubernetes/apps/backend.yaml

echo ""
echo "Deleting monitoring..."
helm uninstall prometheus -n monitoring
kubectl delete namespace monitoring

echo ""
echo "Destroying infrastructure..."
terraform destroy -auto-approve

echo ""
echo "Cleanup complete!"
