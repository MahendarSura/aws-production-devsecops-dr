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
