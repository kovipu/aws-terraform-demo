terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.39"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-north-1"
}

resource "aws_instance" "instance" {
  ami           = "ami-06982ac8da9099c13"
  instance_type = "t3.micro"

  tags = {
    Name = "ExampleInstance"
  }
}