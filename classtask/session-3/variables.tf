variable "instance_type" { // variable name has to be unique withing the working directory
  description = "aws ec2 instance type or size"
  type = string // data constraint or type
  default = "t3.micro" // default value for your variable
}

variable "key_name" {
  description = "ssh key name for aws ec2 instance"
  type = string
  default = "MyMacKey"
}

variable "tags" {
    description = "common tags"
    type = map(string)
    default = {
        Name = "terraform-session-instance"
        Environment = "Development"
    }
}

variable "env" {
    default = "dev"
    description = "Environment"
    type = string
}
// go with lower case only
// use "_" instead of "-" for the seconds labels, variable names