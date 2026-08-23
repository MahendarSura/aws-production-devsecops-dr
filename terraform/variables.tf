variable "aws_region" { type = string; default = "ap-south-1" }
variable "project_name" { type = string; default = "devsecops-dr" }
variable "environment" { type = string; default = "dev" }
variable "vpc_cidr" { type = string; default = "10.0.0.0/16" }
variable "availability_zones" { type = list(string); default = ["ap-south-1a", "ap-south-1b"] }
variable "single_nat_gateway" { type = bool; default = true }
variable "github_repo" { type = string; default = "MahendarSura/aws-production-devsecops-dr" }
variable "eks_cluster_version" { type = string; default = "1.30" }
variable "db_instance_class" { type = string; default = "db.t4g.micro" }
variable "db_name" { type = string; default = "appdb" }
variable "db_username" { type = string; default = "dbadmin" }
