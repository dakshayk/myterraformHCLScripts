provider "aws" {
  region = "ap-south-1"
}

variable "instances" {
  type = map(string)
  default = {
    "Instance-A" = "t2.micro"
    "Instance-B" = "t3.micro"
  }
}



resource "aws_instance" "example" {
  for_each = var.instances

  ami           = "ami-0d6dc87355161e1da"
  instance_type = each.value
  key_name      = "saikey"

  tags          = {
    Name = each.key
  }
}