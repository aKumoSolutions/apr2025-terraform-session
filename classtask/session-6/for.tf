resource "aws_sqs_queue" "name" {
  for_each = toset(var.names)
  name = each.key
}

// I would like to have 3 sqs queue, but I want their name to be queue-1, queue-2, queue-3

variable "names" {
  type = list(string)
  description = "This is a variable for a queue name"
  default = [
    "queue-1",
    "queue-2",
    "queue-3"
  ]
}

// Difference between set of strings vs list of strings

resource "aws_sqs_queue" "main" {
  for_each = toset(local.names)
  name = each.key
}

locals {
  names = [ for i in range(1, 3) : "new-queue-${i}" ]
}

// Python: 
# new-queue = [ f"new-queue-{i}" for i in range(1, 3) ]
# print(new-queue)