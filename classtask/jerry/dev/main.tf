module "ec2" {
  source = "github.com/aKumoSolutions/apr2025-terraform-session//classtask/modules/ec2" // Where the child module is. You can call child modules locally or remotely
############## Input Variables ##################
  ami = "ami-01102c5e8ab69fb75"
  instance_type = "t3.micro"
  env = "dev"
  vpc_security_group_ids = [ module.sg.security_group_id ] // Reference to child module outputs // Syntax: module.module_name.output
}

module "sg" {
  source = "github.com/aKumoSolutions/apr2025-terraform-session//classtask/modules/sg"
############## Input Variables ##################
  name = "terraform-module-sg-main"
  description = "This is a security group for terraform instance"
}

# github.com = platform
# /aKumoSolutions = github organization
# /apr2025-terraform-session = repository
# /tree =
# /main = branch name
# /classtask = folder (subdir)
# /modules = subdir
# /ec2 = subdir

// Terraform always look into a default branch