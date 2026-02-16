variable "ami_id" {
  description = "ami id of the ec2 linux inatance"
  default = "ami-0d6dc87355161e1da"
}

variable "instance_type" {
  description = "inst type of the ec2 linux inatance"
  default = "t2.micro"
}