resource "aws_sqs_queue" "queue" {
  name = "${var.env}-queue"
}

resource "aws_sqs_queue" "manual" {
  name = "manual-queue"
  max_message_size                  = 1048576
}

resource "aws_instance" "main" {
  ami           = "ami-01102c5e8ab69fb75"
  instance_type = "t3.micro"
  key_name      = "MyMacKey"
  tags = { Name = "terraform-session-instance"
    Environment = "development"
  }
}


variable "env" {
  default = "dev"
type = string
}