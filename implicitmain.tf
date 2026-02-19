provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "example" {
  name = "example-sg"
}

resource "aws_instance" "example" {
  ami             = "ami-0d6dc87355161e1da"
  instance_type   = "t2.micro"
  key_name        = "saikey"
  security_groups = [aws_security_group.example.name]

  tags = {
    Name = "Linux_instance"
  }
}