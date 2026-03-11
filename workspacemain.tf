provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-s3-bucket-saidemy1-${terraform.workspace}"
}