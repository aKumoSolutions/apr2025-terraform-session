data "aws_ami" "amazon_linux_2023" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.8.*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "template_file" "userdata" {
    template = file("userdata.sh")

    vars = {
       env = var.env 
       
// env is a variable that in the userdata.sh = var.env is a variable in the variables.tf
    }
}
// Syntax: data first_label second_label