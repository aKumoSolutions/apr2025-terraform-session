terraform {
  backend "s3" {
    bucket = "apr2025-terraform-session-backend"
    key = "jerry/dev/terraform.tfstate"
    region = "us-west-2"
    encrypt = true
  }
}