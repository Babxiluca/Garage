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

resource "aws_s3_bucket" "example" {
  tags = {
    Name  = "Example Bucket"
    Owner = "Name-tutorial"
  }
}