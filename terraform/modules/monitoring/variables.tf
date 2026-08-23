variable "name" {
  description = "Name prefix for monitoring resources"
  type        = string
}

variable "instance_id" {
  description = "EC2 instance ID to monitor"
  type        = string
}

variable "log_retention_days" {
  description = "CloudWatch log retention"
  type        = number
  default     = 30
}

variable "cpu_threshold" {
  description = "CPU alarm threshold percentage"
  type        = number
  default     = 80
}

variable "alarm_actions" {
  description = "SNS or other alarm action ARNs"
  type        = list(string)
  default     = []
}

variable "enable_cpu_alarm" {
  description = "Enable CPU alarm"
  type        = bool
  default     = true
}

variable "enable_status_alarm" {
  description = "Enable EC2 status check alarm"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Common AWS resource tags"
  type        = map(string)
  default     = {}
}
