variable "project_name" {
  type    = string
  default = "devsecops-dr"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "single_nat_gateway" {
  type    = bool
  default = true
}

variable "name" {
  type    = string
  default = "devsecops-dr"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.10.0/24", "10.0.20.0/24"]
}

variable "enable_nat_gateway" {
  type    = bool
  default = true
}

variable "allowed_ingress_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
