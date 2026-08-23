variable "project_name" {
  type    = string
  default = "devsecops-dr-prod"
}

variable "github_repo" {
  type    = string
  default = ""
}

variable "oidc_provider_arn" {
  type    = string
  default = ""
}
