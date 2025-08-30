resource "aws_sqs_queue" "main" {
  name = replace(local.name, "rtype", "sqs" )
  tags = merge(
  local.common_tags, // Map A
  { Name = replace(local.name, "rtype", "sqs" ) } // Map B
  )
}

resource "aws_db_instance" "main" {
  allocated_storage    = 10
  identifier = replace(local.name, "rtype", "rds") // Database Instance Identifier
  db_name              = "mydb" // Database Name
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = random_password.password.result
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = var.env != "prod" ? true : false // dev != prod > true (skip_final_snapshot = true)
  final_snapshot_identifier = var.env != "prod" ?  null : "${replace(local.name, "rtype", "rds-snapshot")}"
}

# true = it will not create a final_snapshot
# false = it will create a final_snapshot

# Scenerio:
# If environment is Prod, I want a final_snapshot
# If environment is Not Prod, I don't want a final_snapshot 

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

// How to reference to a local value
// Create a local for common_tags and 

// Bool = true, false | 1, 0

// Equality Operators

// "a" == "a" 
# > true

# "b" != "a"
# > true

# b == "b"
# > error

# 8 == "8"
# > false 

# true != false
# > true

# Conditional Expression: until you have 3 conditions
# Conditional Hell: you have more than 3 conditions

# Syntax: 
# condition ? true_val : false_val

# Example: 
# "tomato" == "tomate" ? "fruit" : "vegetable"
# > "vegetable"

# Example:
# 8 != 5 ? "yes" : "no"
# > "yes"

# Example: 
# 8 == 5 ? "no" : 8 == 6 ? "no" : 8 == 7 ? "yes" : "no"
# > "no"

# Example:
# var.env != var.project ? var.team : var.business_unit
# > "DevOps"