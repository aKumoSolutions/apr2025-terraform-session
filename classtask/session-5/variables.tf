variable "env" {
  description = "This is a variable for environment"
  type = string
  default = "dev"
}

variable "cloud_region" {
  description = "Cloud Provider region"
  type = string
  default = "usw2"
}

variable "tier" {
  description = "Application tier"
  type = string
  default = "backend"
  
}

variable "business_unit" {
  description = "This is a varaible for Business Unit"
  type = string
  default = "orders"
}

variable "cloud_provider" {
  description = "Cloud Provider"
  type = string
  default = "aws"
}

variable "project" {
    description = "This is a variable for the project"
    type = string
    default = "jerry"
}

variable "team" {
    description = "This is a variable for team name"
    type = string
    default = "DevOps"
}
variable "managed_by" {
    description = "The tool that manages the resource"
    type = string
    default = "Terraform"
}
variable "owner" {
    description = "Project Owner"
    type = string
    default = "kris@akumosolutions.io"  
}