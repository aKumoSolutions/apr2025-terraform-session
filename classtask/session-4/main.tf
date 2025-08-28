resource "aws_security_group" "main" {
  name        = "aws-session-sg"
  description = "This is a security group for ec2 instance"

  tags = {
    Name = "${var.env}-aws-session-sg"
    Name1 = format("%s-aws-session-sg", var.env)
  }
}
resource "aws_vpc_security_group_ingress_rule" "main" {
  count = length(var.ports)    
  security_group_id = aws_security_group.main.id
// 10.0.0.0/16 = VPC CIDR
  cidr_ipv4   = cidrsubnet("10.0.0.0/16", 8, count.index)
  from_port   = element( var.ports, count.index )
  ip_protocol = "tcp"
  to_port     = var.ports[count.index]
  tags = {
    Name = "${var.env}-rule-${var.cidr_blocks[count.index]}"
    Name1 = format("%s-rule-%s", var.env, element(var.cidr_blocks, count.index))
  }
}

# Name = dev-rule-cidr_blocks

// element( [ 22, 25, 80, 443, 3306, 3456 ], count.index )
// >> 22, 25, 80, 443, 3306, 3456

resource "aws_vpc_security_group_egress_rule" "main" {
  security_group_id = aws_security_group.main.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1" // All ports 0-65355, All protcol TCP, UDP, ICMP
}

//Sceneriao:

# I would like to have port 22, 25, 3306, 3456, 80, 443


# element(list, index)

# // retreive an element from a list based on index
# // example

# element( [apple, banana, grape], 2 )
# > grape

# element( [apple, banana, grape], 0 )
# > apple

# elemnt( [ 2, 6, 7, 3, 6, 1, 3, 5, 6, 9 ], 5 )
# > 1

# elemnt( [ 2, 6, 7, 3, 6, 1, 3, 5, 6, 9 ], 9 )
# > 9


# format("Hello, %s!", "Ander")
# >Hello, Ander!

# format("There are %d lights", 4)
# >There are 4 lights