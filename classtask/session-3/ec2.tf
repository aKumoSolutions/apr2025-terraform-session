resource "aws_instance" "main" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [ aws_security_group.main.id ]
  tags = var.tags
  depends_on = [ aws_security_group.main ] // Explicit Dependency
  user_data = data.template_file.userdata.rendered
}

// How to Reference to Resource = Reference to attribute of the resource
// Syntax: first_label.second_label.attribute
// By default, Terraform has implicit dependency

// How to Reference to Input Variable ?
// Syntax: var.variable_name

// How to Reference to Data Source?
// Syntax: data.first_label.second_label.attribute 

# data.first_label.secon_label.attribute vs first_label.second_label.attribute

# user_data = templatefile("userdata.sh"), {
#    env = var.env
# }