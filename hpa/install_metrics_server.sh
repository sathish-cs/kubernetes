#!/bin/bash

set -e

echo "Install Metrics Server in Kubernetes cluster"

# Apply Metrics Server manifests
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml


# Patch the deployment to enable insecure TLS
# Use this only on the test environments. Use cert signed by Kubernetes CA in Prod 
echo "Allow insecure TLS"

kubectl patch deployment metrics-server -n kube-system \
  --type=json \
  -p='[
    {
      "op": "add",
      "path": "/spec/template/spec/containers/0/args/-",
      "value": "--kubelet-insecure-tls"
    }
  ]'

sleep 30s
# Check the resource usage
kubectl top nodes

echo "Metrics Server installation complete"
