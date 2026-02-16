provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source = "./ec2_module"
  #instance_type = "t3.micro"
}

output "ec2_public_ip" {
  value = module.ec2_instance.instance_public_ip
}

output "ec2_private_ip" {
  value = module.ec2_instance.instance_private_ip
}

output "ec2_instance_type" {
  value = module.ec2_instance.instance_type
}
