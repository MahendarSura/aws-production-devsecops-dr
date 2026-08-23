#!/bin/bash
set -euo pipefail
DR_REGION="${AWS_DR_REGION:-ap-southeast-1}"
CLUSTER_NAME="${EKS_CLUSTER_NAME:-devsecops-dr-prod-cluster}"

aws eks update-kubeconfig --name "$CLUSTER_NAME" --region "$DR_REGION"
kubectl scale deployment/production-app --replicas=5 -n production
