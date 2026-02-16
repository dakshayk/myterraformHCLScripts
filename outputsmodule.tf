output "instance_public_ip" {
  description = "the public ip of ec2 instance"
  value       = aws_instance.example_instance.public_ip
}

output "instance_private_ip" {
  description = "the private ip of ec2 instance"
  value       = aws_instance.example_instance.private_ip
}

output "instance_type" {
  description = "the private ip of ec2 instance"
  value       = aws_instance.example_instance.instance_type
}