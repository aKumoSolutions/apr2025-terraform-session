module "ec2" {
  source = "../../modules/ec2" // Where the child module is. You can call child modules locally or remotely
############## Input Variables ##################
  ami = "ami-01102c5e8ab69fb75"
  instance_type = "t3.micro"
  env = "dev"
  vpc_security_group_ids = [ module.sg.security_group_id ] // Reference to child module outputs // Syntax: module.module_name.output
}

module "sg" {
  source = "../../modules/sg"
############## Input Variables ##################
  name = "terraform-module-sg"
  description = "This is a security group for terraform instance"
}

// How to Reference to child module?

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}