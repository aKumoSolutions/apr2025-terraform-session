resource "aws_security_group" "main" {
  name        = "aws-session-sg"
  description = "This is a security group for ec2 instance"


  dynamic "ingress" {
    for_each = var.inbound_rules
    iterator = ports

    content {
    from_port   = ports.value.port
    to_port     = ports.value.port
    protocol    = ports.value.protocol
    cidr_blocks = ports.value.cidr_blocks
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "inbound_rules" {
  description = "This is a variable for inbound rules"
  type = list(object({
    port = number
    protocol = string
    cidr_blocks = list(string)
  }))
  default = [ {
    port = 80
    protocol = "tcp"
    cidr_blocks = [ "10.0.0.1/32" ]
  },
  {
    port = 443
    protocol = "tcp"
    cidr_blocks = [ "10.0.0.2/32" ]
  },
  {
    port = 22
    protocol = "tcp"
    cidr_blocks = [ "10.0.0.3/32" ]
  }
   ]
}