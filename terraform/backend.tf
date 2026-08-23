terraform {
  backend "s3" {
    bucket       = "devsecops-dr-terraform-state"
    key          = "state/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
