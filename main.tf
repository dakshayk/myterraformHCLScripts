provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "name" {
  ami = "ami-0d8615fe7da9ec6df"
  instance_type = "t2.micro"
  key_name = "saikey"
  tags = {
    Name = "akshay instance"
  }
}