terraform {
  backend "s3" {
    bucket               = "apr2025-terraform-session-backend"
    key                  = "terraform.tfstate"
    region               = "us-west-2"
    encrypt              = true
    workspace_key_prefix = "workspaces"
  }
}
// 1. Each workspace will have its own terraform.tfsate file

// Syntax: bucket/workspace_key_prefix/workspace_name/key
// Example: apr2025-terraform-session-backend/workspaces/dev/terraform.tfstate