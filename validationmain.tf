provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "main" {
  name        = "example-sg"
  description = "Example security group"
}

resource "aws_instance" "example" {
  ami           = "ami-0d6dc87355161e1da"
  instance_type = "t2.micro"
  key_name      = "saikey"
  lifecycle {
    precondition {
      condition     = aws_security_group.main.id != ""
      error_message = "Security group Id must not be empty"
    }
    postcondition {
      condition     = self.public_ip != ""
      error_message = "publicip must be present"
    }
  }

  tags = {
    Name = "Linux_instance123"
  }
}