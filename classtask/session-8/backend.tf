terraform {
  backend "s3" {
    bucket = "apr2025-terraform-session-backend"
    key = "session-8/terraform.tfstate"
    region = "us-west-2"
    encrypt = true
  }
}

// You cannot use variable