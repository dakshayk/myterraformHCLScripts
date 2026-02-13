provider "aws" {
  region = "ap-south-1"
}

variable "instance_tags" {
  type = map(string)
  default = {
    Name = "sai-Instance"
    Team = "Devops"
  }
}

variable "instance_types" {
  type    = list(string)
  default = ["t2.micro", "t3.micro"]
}


resource "aws_instance" "example" {
  ami           = "ami-0d6dc87355161e1da"
  instance_type = var.instance_types[0]
  key_name      = "saikey"
  tags          = var.instance_tags

}