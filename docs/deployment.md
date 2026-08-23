# Deployment Architecture

All containerized applications are deployed declaratively using ArgoCD tracking the  branch. Infrastructure provisioning uses Terraform with isolated remote states per environment.
