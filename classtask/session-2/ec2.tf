resource "aws_instance" "main" {
  ami           = "ami-01102c5e8ab69fb75"
  instance_type = "t3.micro"
  key_name      = "MyMacKey"
  tags = { Name = "terraform-session-instance"
    Environment = "development"
  }
}

// resource block = create and manage resources
// aws_instance = first_label, indicates the resource that you want to interact, defined by Terraform
// main = second_label, logical id or logical name of the resource, defined by me (Must Unique within Working Dir)
// argument = key value pairs, configurations of the resource
// "" = string
// {} = map
