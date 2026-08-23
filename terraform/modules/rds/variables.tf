variable "project_name" {
  type    = string
  default = "devsecops-dr-prod"
}

variable "db_name" {
  type    = string
  default = "appdb"
}

variable "db_instance_class" {
  type    = string
  default = "db.t4g.micro"
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "subnet_ids" {
  type    = list(string)
  default = []
}
