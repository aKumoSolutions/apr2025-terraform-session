terraform {
  backend "s3" {
    bucket = "apr2025-terraform-session-backend"
    key = "session-3/terraform.tfstate"  // key prefix 
    region = "us-west-2"
    encrypt = true
  }
}

# "true" = string
# true = boolean