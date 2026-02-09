provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example_instance" {
  ami                    = "ami-0d6dc87355161e1da"
  instance_type          = "t3.micro"    #configuration changed from t2.micro to t3.micro
  key_name               = "saikey"
  vpc_security_group_ids = [aws_security_group.example_sg.id]
  count                  = 2


  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }


  tags = {                           #instances names Linux1 and Linux2 i.e. 2 instances
    Name = element(["linux1", "Linux2"], count.index)
  }
}

resource "aws_security_group" "example_sg" {
    # Security Group is created using a Terraform resource block, so Terraform owns it.
    # When terraform destroy is executed, the EC2 instance is deleted first,followed by the Security Group.
    #If a Security Group is created outside Terraform (console/CLI) and its ID
    # vpc_security_group_ids = ["sg-0abc12345"]
    # is referenced directly, Terraform will NOT delete that Security Group.
  name        = "example_security_group"   #name of the securitygroup
  description = "allow ssh and http"       #description of the SG


  ingress {
    from_port   = 22
    to_port     = 22
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
    protocol    = "-1" # -1 means by default it will allow all protocols
    cidr_blocks = ["0.0.0.0/0"]

  }
}
#actually these outputs are not put in class these you learned from chat gpt
output "instance_public_ip" {
  description = "the public ip of ec2 instance"
  value       = aws_instance.example_instance[*].public_ip
}

output "instance_private_ip" {
  description = "the private ip of ec2 instance"
  value       = aws_instance.example_instance[*].private_ip

}
