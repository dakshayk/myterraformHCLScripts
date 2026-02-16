resource "aws_instance" "example_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "saikey"
  
  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }


  tags = { 
    Name = "Linux-instance"
  }
}
