terraform {
  backend "s3" {
    bucket = "apr2025-terraform-session-backend"
    key = "session-9/terraform.tfstate"
    region = "us-west-2"
    encrypt = true
    dynamodb_table = "apr2025-terraform-state-locking"
  }
}