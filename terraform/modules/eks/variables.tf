variable "project_name" {
  type    = string
  default = "devsecops-dr"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "cluster_name" {
  type    = string
  default = "devsecops-dr-cluster"
}

variable "cluster_version" {
  type    = string
  default = "1.30"
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "subnet_ids" {
  type    = list(string)
  default = []
}

variable "private_subnet_ids" {
  type    = list(string)
  default = []
}

variable "cluster_role_arn" {
  type    = string
  default = ""
}

variable "node_role_arn" {
  type    = string
  default = ""
}
