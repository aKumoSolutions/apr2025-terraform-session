resource "aws_sqs_queue" "main" {
    name = format("%s-queue", var.env)
}

variable "env" {
  type = string
  description = "Environment"
  default = "dev"
}