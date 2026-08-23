# Enterprise AWS Multi-AZ DevSecOps Platform & Disaster Recovery (DR)

A production-grade, highly available, and zero-trust cloud infrastructure deployed on AWS with GitOps automated continuous delivery, automated vulnerability gating, and multi-region disaster recovery.

## Architectural Highlights
- **Multi-AZ Infrastructure:** 3-Tier VPC across 3 Availability Zones with managed EKS 1.30 and Multi-AZ RDS PostgreSQL.
- **GitOps Continuous Delivery:** Declarative deployment management via ArgoCD and parameterized Helm charts.
- **Shift-Left DevSecOps:** Automated Trivy container/filesystem scanning and Checkov IaC security gates.
- **Automated Disaster Recovery:** Multi-region active-passive topology (`ap-south-1` -> `ap-southeast-1`) targeting **RTO < 15 mins** and **RPO < 5 mins**.
- **Observability Stack:** Prometheus Alertmanager rules and Grafana real-time metrics dashboards.
