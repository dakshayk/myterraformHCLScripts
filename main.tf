provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example_instance" {
  ami                    = "ami-0d8615fe7da9ec6df"
  instance_type          = "t2.micro"
  key_name               = "saikey"
  vpc_security_group_ids = [aws_security_group.example_sg.id]



  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }


  tags = {
    Name = "Windows_instance"
  }
}

resource "aws_security_group" "example_sg" {

  name        = "example_security_group"
  description = "allow rdp and http"


  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

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