provider "aws" {
  region = "ap-south-1"
}



resource "aws_s3_bucket" "example" {
  bucket = "myakshaypublicbucket"

  lifecycle {
    #create_before_destroy = true
    #prevent_destroy = true
    #ignore_changes = [ tags ]
  }

  tags = {
    Name = "my s3 bucket"
    Environment = "Production"
  }
}