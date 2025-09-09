resource "aws_key_pair" "main" {
  key_name   = "KrisMacKey"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_security_group" "main" {
  name = "terraform-session8-sg"
  description = "This is a security group for Session-8"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
    egress {
    from_port = 0
    to_port = 0 
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}

resource "aws_instance" "main" {
  ami           = "ami-01102c5e8ab69fb75"
  instance_type = "t3.micro"
  key_name      = aws_key_pair.main.id 
  depends_on = [ aws_key_pair.main.id ]
  vpc_security_group_ids = [ aws_security_group.main.id ]

  provisioner "file" {
    source = "./index.html" // Local Path, The path where your file is, local machine
    destination = "/tmp/index.html" // Remote Path, The path where you send the file to, remote machine
  }
  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip // Public IP of your instance
    private_key = file("~/.ssh/id_ed25519")
  }
  provisioner "remote-exec" {
    inline = [
        "sudo dnf install httpd -y",
        "sudo systemctl enable httpd",
        "sudo systemctl start httpd",
        "sudo cp /tmp/index.html /var/www/html/index.html"
    ]
   connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip // Public IP of your instance
    private_key = file("~/.ssh/id_ed25519")
  }
}
}
# ssh ec2-user@public ip

resource "aws_s3_bucket" "main" {
  bucket = "terraform-sesson8-bucket-kris"
}

resource "null_resource" "upload" {
  provisioner "local-exec" {
    command = "aws s3 cp ./ssn.txt s3://${aws_s3_bucket.main.bucket}/"
  }
}

resource "null_resource" "main" {
    provisioner "local-exec" {
      command = "echo 'testing local exec provisioner' > test.txt"
    }
}