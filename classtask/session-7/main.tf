resource "aws_sqs_queue" "main" {
    name = format("%s-queue", var.env)
    alias = "oregon"
}

variable "env" {
  type = string
  description = "Environment"
  default = "dev"
}