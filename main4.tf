provider "aws" {
  region = "ap-south-1"
}

#variable "cidr" {
 # description = "CIDR block range for SG"
  #type        = string
#}

resource "aws_instance" "example_instance" {
  ami                    = "ami-0d6dc87355161e1da"
  instance_type          = "t2.micro"
  key_name               = "saikey"
  vpc_security_group_ids = [aws_security_group.example_sg.id]



  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }


  tags = { #instances names Linux1 and Linux2 i.e. 2 instances
    Name = "Linux-instance"
  }
}

resource "aws_security_group" "example_sg" {
  name        = "example_security_group" #name of the securitygroup
  description = "allow ssh and http"     #description of the SG


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means by default it will allow all protocols
    cidr_blocks = [var.cidr]

  }
}
output "instance_public_ip" {
  description = "the public ip of ec2 instance"
  value       = aws_instance.example_instance.public_ip
}

output "instance_private_ip" {
  description = "the private ip of ec2 instance"
  value       = aws_instance.example_instance.private_ip
}