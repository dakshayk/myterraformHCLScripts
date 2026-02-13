provider "aws" {
  region = "ap-south-1"
}

variable "instance_config" {
  type = object({
    ami           = string
    instance_type = list(string)
    key_name      = string
    tags          = map(string)
  })

  default = {
    ami           = "ami-0d6dc87355161e1da"
    instance_type = ["t2.micro", "t3.micro"]
    key_name      = "saikey"
    tags = {
        Name = "Linux-instance"
    }
  }
}

resource "aws_instance" "example" {
  ami           = var.instance_config.ami
  instance_type = var.instance_config.instance_type[1]
  key_name      = var.instance_config.key_name
  tags          = var.instance_config.tags
}