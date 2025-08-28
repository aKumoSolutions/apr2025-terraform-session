variable "env" {
  description = "This is an environment"
  type = string
  default = "dev"
}

variable "ports" {
  description = "This is a list of TCP ports"
  type = list(number)
  default = [ 22, 25, 80, 443, 3306, 3456 ]
}
variable "cidr_blocks" {
  description = "This is a list of CIDR blocks"
  type = list(string)
  default = [ "10.0.0.0/16", "192.168.0.0/24", "10.0.0.0/8", "192.168.2.0/24", "172.31.0.0/24", "10.0.0.0/8"]
}