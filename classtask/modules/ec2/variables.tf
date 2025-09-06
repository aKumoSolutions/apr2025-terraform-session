variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "env" {
  type = string
}
variable "vpc_security_group_ids" {
  type = list(string)
}