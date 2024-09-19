terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }
}

provider "aws" {
  # Configuration options
  #KEY
}


resource "aws_instance" "web" {
ami = data.aws_ami.ubuntu.id
instance_type = "t3.micro"
}

  
resource "aws_s3_bucket" "example" {
  tags = {
    Name  = "Example Bucket"
    Owner = "Name-tutorial"
  }

}