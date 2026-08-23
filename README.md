# 🚀 Enterprise AWS Multi-AZ DevSecOps Platform & Disaster Recovery

[![AWS](https://img.shields.io/badge/AWS-Cloud-232F3E?style=for-the-badge&logo=amazon-web-services&logoColor=white)](https://aws.amazon.com/)
[![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Amazon EKS](https://img.shields.io/badge/Amazon-EKS-FF9900?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/eks/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestration-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![Docker](https://img.shields.io/badge/Docker-Containers-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Helm](https://img.shields.io/badge/Helm-Packaging-0F1689?style=for-the-badge&logo=helm&logoColor=white)](https://helm.sh/)
[![ArgoCD](https://img.shields.io/badge/ArgoCD-GitOps-EF7B4D?style=for-the-badge&logo=argo&logoColor=white)](https://argo-cd.readthedocs.io/)
[![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI%2FCD-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)](https://github.com/features/actions)
[![Trivy](https://img.shields.io/badge/Trivy-Security-1904DA?style=for-the-badge)](https://trivy.dev/)
[![Checkov](https://img.shields.io/badge/Checkov-IaC_Security-6B4FBB?style=for-the-badge)](https://www.checkov.io/)
[![Prometheus](https://img.shields.io/badge/Prometheus-Monitoring-E6522C?style=for-the-badge&logo=prometheus&logoColor=white)](https://prometheus.io/)
[![Grafana](https://img.shields.io/badge/Grafana-Observability-F46800?style=for-the-badge&logo=grafana&logoColor=white)](https://grafana.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-336791?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

---

## 📌 Project Overview

**Enterprise AWS Multi-AZ DevSecOps Platform & Disaster Recovery** is a production-oriented cloud infrastructure project demonstrating the integration of AWS infrastructure, Infrastructure as Code, Kubernetes, CI/CD, DevSecOps, GitOps, observability, and disaster recovery.

The platform is designed around:

- ☁️ AWS cloud infrastructure
- 🌐 Multi-AZ networking
- 🏗️ Terraform Infrastructure as Code
- ☸️ Amazon EKS
- 🐳 Docker containers
- ⛵ Helm
- 🔄 ArgoCD GitOps
- 🚀 GitHub Actions CI/CD
- 🔐 DevSecOps security controls
- 🔍 Trivy vulnerability scanning
- 🛡️ Checkov IaC security scanning
- 🗄️ Amazon RDS PostgreSQL
- 📊 Prometheus
- 🚨 Alertmanager
- 📈 Grafana
- ♻️ Multi-region disaster recovery

---

# 🏗️ Architecture

~~~text
                         ┌─────────────────────┐
                         │      DEVELOPER      │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │   GITHUB REPOSITORY │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │   GITHUB ACTIONS    │
                         │       CI / CD       │
                         └──────────┬──────────┘
                                    │
                  ┌─────────────────┼─────────────────┐
                  │                 │                 │
                  ▼                 ▼                 ▼
             Terraform            Trivy            Checkov
             Validation          Security          IaC Scan
                  │                 │                 │
                  └─────────────────┼─────────────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │    DOCKER BUILD     │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │  CONTAINER REGISTRY │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │       ARGOCD        │
                         │       GITOPS        │
                         └──────────┬──────────┘
                                    │
                                    ▼
              ┌──────────────────────────────────────────┐
              │              AWS PRIMARY REGION           │
              │                 ap-south-1                │
              │                                          │
              │   ┌──────────────────────────────────┐   │
              │   │               VPC                │   │
              │   │                                  │   │
              │   │     AZ-1    AZ-2    AZ-3         │   │
              │   │      │       │       │           │   │
              │   │      └───────┼───────┘           │   │
              │   │              │                   │   │
              │   │          AMAZON EKS              │   │
              │   │              │                   │   │
              │   │    Kubernetes Applications       │   │
              │   │              │                   │   │
              │   │      Amazon RDS PostgreSQL       │   │
              │   │            Multi-AZ              │   │
              │   └──────────────────────────────────┘   │
              └──────────────────────┬───────────────────┘
                                     │
                                     ▼
                         ┌─────────────────────┐
                         │    OBSERVABILITY    │
                         │ Prometheus + Grafana│
                         │    + Alertmanager   │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │ DISASTER RECOVERY   │
                         │   ap-southeast-1    │
                         └─────────────────────┘
~~~

## 🧩 Architecture Components

| Layer | Components |
|---|---|
| ☁️ Cloud | AWS |
| 🌐 Networking | VPC, Public Subnets, Private Subnets, Multi-AZ |
| ☸️ Platform | Amazon EKS |
| 🐳 Containers | Docker |
| ⛵ Packaging | Helm |
| 🔄 GitOps | ArgoCD |
| 🚀 CI/CD | GitHub Actions |
| 🔐 Security | IAM, Trivy, Checkov |
| 🗄️ Database | Amazon RDS PostgreSQL |
| 📊 Monitoring | Prometheus |
| 🚨 Alerting | Alertmanager |
| 📈 Visualization | Grafana |
| ♻️ Disaster Recovery | Multi-Region |
| 🌎 Primary Region | `ap-south-1` |
| 🌎 DR Region | `ap-southeast-1` |

---

# 🛠️ Technology Stack

| Category | Technology |
|---|---|
| Cloud Platform | AWS |
| Infrastructure as Code | Terraform |
| Networking | Amazon VPC, Multi-AZ |
| Kubernetes | Amazon EKS |
| Containers | Docker |
| Kubernetes Packaging | Helm |
| GitOps | ArgoCD |
| CI/CD | GitHub Actions |
| Container Security | Trivy |
| IaC Security | Checkov |
| Identity & Access | AWS IAM |
| Database | Amazon RDS PostgreSQL |
| Monitoring | Prometheus |
| Alerting | Alertmanager |
| Visualization | Grafana |
| Automation | Bash / Makefile |
| Disaster Recovery | Multi-Region AWS |

---

# ☁️ AWS Infrastructure

AWS infrastructure is provisioned and managed using Terraform.

### Core Infrastructure

- 🌐 Amazon VPC
- 🔀 Multi-AZ networking
- 🌍 Public and private subnets
- ☸️ Amazon EKS
- 🗄️ Amazon RDS PostgreSQL
- 🔑 AWS IAM
- 🛡️ Security controls
- 🔗 Kubernetes networking
- 📊 Monitoring infrastructure
- ♻️ Disaster recovery infrastructure

### Infrastructure Principles

- Infrastructure as Code
- Modular Terraform design
- Version-controlled infrastructure
- Environment separation
- Repeatable deployments
- Security-focused configuration
- High availability
- Disaster recovery readiness

---

# 🏗️ Terraform Infrastructure as Code

Terraform manages AWS infrastructure declaratively and keeps infrastructure configuration version-controlled.

### Terraform Workflow

~~~text
Terraform Configuration
          │
          ▼
    terraform init
          │
          ▼
     terraform fmt
          │
          ▼
  terraform validate
          │
          ▼
    terraform plan
          │
          ▼
    terraform apply
          │
          ▼
    AWS Infrastructure
~~~

### Terraform Structure

~~~text
terraform/
├── backend.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
│
├── environments/
│   ├── dev/
│   ├── staging/
│   └── prod/
│
└── modules/
    ├── ec2/
    ├── eks/
    ├── iam/
    ├── monitoring/
    ├── rds/
    └── vpc/
~~~

---

# ☸️ Amazon EKS & Kubernetes

Amazon EKS provides the managed Kubernetes platform for running containerized workloads.

### Kubernetes Resources

- Deployments
- Services
- ConfigMaps
- Secrets
- Ingress
- Application workloads
- Service networking
- Workload monitoring
- Declarative configuration

Kubernetes resources are maintained under:

~~~text
kubernetes/
~~~

Terraform provisions the EKS infrastructure, while Kubernetes, Helm, and ArgoCD manage application workloads.

---

# 🐳 Docker & Containerization

Docker is used to package applications into portable and consistent container images.

### Container Workflow

~~~text
Application Source
       │
       ▼
   Dockerfile
       │
       ▼
 Docker Build
       │
       ▼
Container Image
       │
       ▼
 Trivy Scan
       │
       ▼
Container Registry
       │
       ▼
   Amazon EKS
~~~

### Container Security

Container images are scanned using Trivy before deployment to identify known vulnerabilities.

---

# ⛵ Helm

Helm provides Kubernetes application packaging and release management.

### Helm Structure

~~~text
helm/
└── production-app/
~~~

### Helm Responsibilities

- Kubernetes application packaging
- Reusable templates
- Configuration management
- Environment-specific values
- Repeatable deployments
- Release management

Helm integrates with ArgoCD for GitOps-based application delivery.

---

# 🔄 GitOps with ArgoCD

ArgoCD continuously synchronizes the desired Kubernetes state stored in Git with the EKS cluster.

~~~text
Git Repository
      │
      ▼
    ArgoCD
      │
      ▼
Desired Kubernetes State
      │
      ▼
  Amazon EKS
      │
      ▼
Kubernetes Workloads
~~~

### GitOps Benefits

- 🔄 Continuous synchronization
- 📜 Git-based desired state
- 🔍 Deployment visibility
- ↩️ Rollback capability
- 🎯 Declarative deployments
- 🔐 Controlled application delivery

### ArgoCD Structure

~~~text
argocd/
├── application.yaml
└── project.yaml
~~~

---

# 🚀 GitHub Actions CI/CD

GitHub Actions automates infrastructure validation, security checks, container workflows, and deployment processes.

### Workflow Structure

~~~text
.github/
└── workflows/
    ├── ci.yml
    ├── cd.yml
    ├── security.yml
    └── disaster-recovery.yml
~~~

### CI/CD Responsibilities

- Terraform validation
- Configuration validation
- Security scanning
- Container scanning
- IaC security validation
- Docker build
- Deployment automation
- Disaster recovery automation

### CI/CD Flow

~~~text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
GitHub Actions
    │
    ├───────────────┬───────────────┐
    ▼               ▼               ▼
Terraform         Trivy          Checkov
Validation        Scan           IaC Scan
    │               │               │
    └───────────────┴───────────────┘
                    │
                    ▼
              Docker Build
                    │
                    ▼
             Container Registry
                    │
                    ▼
                  ArgoCD
                    │
                    ▼
                Amazon EKS
~~~

---

# 🔐 DevSecOps & Security

Security is integrated into the infrastructure and application delivery lifecycle.

### Security Controls

- AWS IAM
- Least-privilege access
- Network segmentation
- Security groups
- Kubernetes security controls
- Container vulnerability scanning
- Infrastructure security scanning
- CI/CD security gates
- Secure configuration management

### Security Tools

| Tool | Purpose |
|---|---|
| Trivy | Container and filesystem vulnerability scanning |
| Checkov | Terraform / IaC security validation |
| AWS IAM | Identity and access control |
| Security Policies | Infrastructure and workload security |

### DevSecOps Flow

~~~text
Developer
    │
    ▼
Git Push
    │
    ▼
GitHub Actions
    │
    ├───────────────┬───────────────┐
    ▼               ▼               ▼
Terraform         Trivy          Checkov
Validation        Scan           IaC Scan
    │               │               │
    └───────────────┴───────────────┘
                    │
                    ▼
              Security Gate
                    │
                    ▼
               Deployment
~~~

---

# 📊 Monitoring & Observability

The platform uses Prometheus, Alertmanager, and Grafana for operational monitoring and visibility.

~~~text
AWS Infrastructure
        │
        ▼
    Amazon EKS
        │
   ┌────┴────┐
   ▼         ▼
Kubernetes  Application
 Metrics     Metrics
   │         │
   └────┬────┘
        ▼
   Prometheus
        │
        ▼
  Alertmanager
        │
        ▼
     Grafana
        │
        ▼
Operational Visibility
~~~

### Observability Capabilities

- Cluster health
- Kubernetes workload metrics
- Infrastructure metrics
- Application metrics
- Service health
- Alerting
- Performance visibility
- Troubleshooting

Monitoring configuration is maintained under:

~~~text
monitoring/
~~~

---

# 🗄️ Amazon RDS PostgreSQL

Amazon RDS PostgreSQL provides the managed database layer for application workloads.

~~~text
Amazon EKS
    │
    ▼
Kubernetes Application
    │
    ▼
Amazon RDS PostgreSQL
       Multi-AZ
    │
    ▼
Persistent Application Data
~~~

### Database Architecture

- Managed PostgreSQL
- Private network placement
- Multi-AZ availability
- Security-group controlled access
- Automated backup capability
- Monitoring integration
- Disaster recovery integration

RDS Terraform configuration is maintained under:

~~~text
terraform/modules/rds/
~~~

---

# 🌎 Multi-AZ High Availability

Production infrastructure is distributed across multiple Availability Zones.

~~~text
                         AWS VPC
                            │
          ┌─────────────────┼─────────────────┐
          │                 │                 │
          ▼                 ▼                 ▼
       AZ-1              AZ-2              AZ-3
          │                 │                 │
      EKS Nodes         EKS Nodes         EKS Nodes
          │                 │                 │
          └─────────────────┼─────────────────┘
                            │
                            ▼
                       Amazon EKS
                            │
                            ▼
                     RDS Multi-AZ
~~~

### High Availability Benefits

- Reduced single-AZ dependency
- Workload distribution
- Fault isolation
- Improved resilience
- Better production availability
- Multi-AZ database availability

---

# ♻️ Disaster Recovery

The platform includes a secondary AWS region for disaster recovery.

### Regional Topology

~~~text
              PRIMARY REGION
                ap-south-1
                    │
                    ▼
          Production Infrastructure
                    │
                    ▼
             Backup / Recovery
                    │
                    ▼
              DR REGION
            ap-southeast-1
                    │
                    ▼
          Recovery Infrastructure
~~~

| Role | Region |
|---|---|
| 🟢 Primary | `ap-south-1` |
| 🔵 DR | `ap-southeast-1` |

### DR Capabilities

- Multi-region recovery architecture
- Infrastructure recreation
- Recovery automation
- Backup and recovery procedures
- DR validation
- Business continuity support
- Primary-to-secondary recovery process

DR resources are maintained under:

~~~text
disaster-recovery/
~~~

---

# 🧪 Testing & Validation

Testing and validation resources are maintained under:

~~~text
tests/
~~~

### Validation Areas

- Terraform configuration
- Kubernetes manifests
- Infrastructure configuration
- Security controls
- Container configuration
- Deployment configuration
- Disaster recovery workflows

### Terraform Validation

~~~bash
terraform fmt -check -recursive
terraform validate
~~~

### Kubernetes Validation

~~~bash
kubectl get nodes
kubectl get pods -A
kubectl get deployments
kubectl get services
kubectl get ingress
~~~

---

# 🌎 Environment Strategy

The platform follows environment separation for controlled infrastructure and application delivery.

| Environment | Purpose |
|---|---|
| 🟢 Development | Development and testing |
| 🟡 Staging | Pre-production validation |
| 🔴 Production | Production workloads |

~~~text
Development
     │
     ▼
  Staging
     │
     ▼
 Production
     │
     ▼
 Disaster Recovery
~~~

---

# 📂 Repository Structure

~~~text
aws-production-devsecops-dr/
│
├── .github/
│   └── workflows/
│       ├── ci.yml
│       ├── cd.yml
│       ├── security.yml
│       └── disaster-recovery.yml
│
├── argocd/
├── disaster-recovery/
├── docker/
├── docs/
├── helm/
├── kubernetes/
├── monitoring/
├── scripts/
│
├── security/
│   ├── policies/
│   ├── sonarqube/
│   └── trivy/
│
├── terraform/
│   ├── backend.tf
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── providers.tf
│   │
│   ├── environments/
│   │   ├── dev/
│   │   ├── staging/
│   │   └── prod/
│   │
│   └── modules/
│       ├── ec2/
│       ├── eks/
│       ├── iam/
│       ├── monitoring/
│       ├── rds/
│       └── vpc/
│
├── tests/
├── .gitignore
├── CHANGELOG.md
├── LICENSE
├── Makefile
├── README.md
├── SECURITY.md
└── docker-compose.yml
~~~

---

# ⚙️ Makefile Operations

The Makefile provides shortcuts for common infrastructure and deployment operations.

~~~bash
make help
make fmt
make validate
make lint
make plan
make apply
make deploy
~~~

| Command | Purpose |
|---|---|
| `make help` | Display available operations |
| `make fmt` | Format Terraform configuration |
| `make validate` | Validate infrastructure |
| `make lint` | Run quality and security checks |
| `make plan` | Generate Terraform plan |
| `make apply` | Provision infrastructure |
| `make deploy` | Deploy application |

---

# 🚀 Deployment

## 1. Validate Terraform

~~~bash
terraform fmt -check -recursive
terraform validate
~~~

## 2. Initialize Terraform

~~~bash
terraform init
~~~

## 3. Review Infrastructure

~~~bash
terraform plan
~~~

## 4. Provision Infrastructure

~~~bash
terraform apply
~~~

Terraform provisions the required AWS infrastructure.

## 5. Configure EKS Access

~~~bash
aws eks update-kubeconfig \
  --region <AWS_REGION> \
  --name <EKS_CLUSTER_NAME>
~~~

## 6. Verify EKS

~~~bash
kubectl get nodes
kubectl get pods -A
~~~

## 7. Deploy Applications

Application delivery is managed through:

- Helm
- ArgoCD
- Kubernetes
- GitHub Actions

## 8. Verify Deployment

~~~bash
kubectl get deployments
kubectl get services
kubectl get ingress
~~~

---

# 🔄 End-to-End Platform Workflow

~~~text
                         DEVELOPER
                             │
                             ▼
                     GitHub Repository
                             │
                             ▼
                    GitHub Actions CI/CD
                             │
          ┌──────────────────┼──────────────────┐
          │                  │                  │
          ▼                  ▼                  ▼
     Terraform             Trivy             Checkov
     Validation            Security          IaC Scan
          │                  │                  │
          └──────────────────┼──────────────────┘
                             │
                             ▼
                       Docker Build
                             │
                             ▼
                    Container Registry
                             │
                             ▼
                           ArgoCD
                             │
                             ▼
                         Amazon EKS
                             │
                  ┌──────────┴──────────┐
                  ▼                     ▼
             Application             RDS
             Workloads             PostgreSQL
                  │
                  ▼
        Prometheus + Alertmanager
                  │
                  ▼
               Grafana
                  │
                  ▼
          Operational Visibility
                  │
                  ▼
        Multi-Region Disaster Recovery
~~~

---

# 🎯 Engineering Practices Demonstrated

### ☁️ Cloud Engineering

- AWS
- VPC
- Multi-AZ architecture
- Amazon EKS
- Amazon RDS
- IAM

### 🏗️ Infrastructure Engineering

- Terraform
- Modular IaC
- Environment separation
- Version-controlled infrastructure
- Reproducible provisioning

### ☸️ Kubernetes Engineering

- Amazon EKS
- Deployments
- Services
- ConfigMaps
- Secrets
- Ingress
- Workload management

### 🐳 Container Engineering

- Docker
- Container images
- Container security scanning
- Kubernetes integration

### 🔄 GitOps Engineering

- Helm
- ArgoCD
- Declarative deployment
- Desired-state management
- Continuous synchronization

### 🚀 CI/CD Engineering

- GitHub Actions
- Automated validation
- Security gates
- Container build
- Continuous delivery

### 🔐 DevSecOps Engineering

- Trivy
- Checkov
- IAM
- Security policies
- Container security
- IaC security
- Shift-left security

### 📊 Observability Engineering

- Prometheus
- Alertmanager
- Grafana
- Kubernetes monitoring
- Infrastructure metrics
- Application observability

### ♻️ Disaster Recovery Engineering

- Multi-region architecture
- Primary region: `ap-south-1`
- DR region: `ap-southeast-1`
- Recovery automation
- DR validation

---

# 🏆 What This Project Demonstrates

This project demonstrates an integrated enterprise-style DevSecOps platform covering the complete infrastructure and application lifecycle:

~~~text
Infrastructure as Code
        │
        ▼
AWS Multi-AZ Infrastructure
        │
        ▼
Amazon EKS
        │
        ▼
Containerized Workloads
        │
        ▼
GitOps Deployment
        │
        ▼
DevSecOps Security
        │
        ▼
Monitoring & Observability
        │
        ▼
Multi-Region Disaster Recovery
        │
        ▼
Production Resilience
~~~

---

# 📋 Production-Oriented Capabilities

| Area | Implementation |
|---|---|
| High Availability | Multi-AZ |
| Cloud Platform | AWS |
| Infrastructure | Terraform |
| Kubernetes | Amazon EKS |
| Containers | Docker |
| Application Packaging | Helm |
| Deployment | ArgoCD |
| CI/CD | GitHub Actions |
| Container Security | Trivy |
| IaC Security | Checkov |
| Identity | AWS IAM |
| Database | Amazon RDS PostgreSQL |
| Monitoring | Prometheus |
| Alerting | Alertmanager |
| Visualization | Grafana |
| Disaster Recovery | Multi-Region |
| Environments | Dev / Staging / Production |
| Validation | Automated Checks |
| Configuration | Version Controlled |
| Operations | Documentation / Runbooks |

---

# 📚 Documentation

Detailed project documentation can be maintained under:

~~~text
docs/
~~~

Recommended documentation areas include:

- Architecture
- Deployment
- Security
- Testing
- Operations
- Disaster Recovery
- Runbooks

The root README focuses on architecture, infrastructure, DevSecOps workflow, deployment, observability, and disaster recovery.

---

# 📄 License

This project is licensed under the **MIT License**.

See the [LICENSE](LICENSE) file for details.

---
