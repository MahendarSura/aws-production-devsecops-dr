variable "name" {
  description = "Name prefix for EC2 resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for EC2 instances"
  type        = list(string)
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "Optional AMI ID"
  type        = string
  default     = null
}

variable "application_port" {
  description = "Application port"
  type        = number
  default     = 8080
}

variable "allowed_security_group_ids" {
  description = "Security groups allowed to access the application"
  type        = list(string)
  default     = []
}

variable "associate_public_ip_address" {
  description = "Whether instances receive public IP addresses"
  type        = bool
  default     = false
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB"
  type        = number
  default     = 20
}

variable "user_data" {
  description = "Optional EC2 bootstrap script"
  type        = string
  default     = null
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}
