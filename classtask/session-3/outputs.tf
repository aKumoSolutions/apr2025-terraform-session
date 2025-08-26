output "ipv4_public_ip" {
  value = aws_instance.main.public_ip
}
// Syntax: output name_of_output