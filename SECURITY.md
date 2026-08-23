# Security Baseline
- **Least Privilege:** IAM Roles for Service Accounts (IRSA) with OIDC authentication.
- **Network Isolation:** Kubernetes NetworkPolicies with default-deny baseline.
- **Container Hardening:** Read-only root filesystem, dropped Linux capabilities (`ALL`).
