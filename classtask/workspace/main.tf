resource "aws_sqs_queue" "main" {
  name = "${terraform.workspace}-queue"
}

// How to Reference to Workspace?
// Syntax: terraform.workspace