terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "vpc" {
  source             = "./modules/vpc"
  project_name       = var.project_name
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  enable_nat_gateway = var.single_nat_gateway
}

module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
  environment  = var.environment
  github_repo  = var.github_repo
}

module "eks" {
  source             = "./modules/eks"
  project_name       = var.project_name
  cluster_name       = "${var.project_name}-${var.environment}-cluster"
  cluster_version    = var.eks_cluster_version
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  cluster_role_arn   = module.iam.eks_cluster_role_arn
  node_role_arn      = module.iam.eks_nodes_role_arn
}

module "rds" {
  source             = "./modules/rds"
  project_name       = var.project_name
  db_name            = var.db_name
  db_username        = var.db_username
  db_instance_class  = var.db_instance_class
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
}
