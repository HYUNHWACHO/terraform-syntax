terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.1"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-3"
}

# Create a VPC
resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main"
  }
}

# Create a Public Subnet
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.100.0/24"

  tags = {
    Name = "hangaramqpt_public_subnet_1"
  }
}

# resource "aws_subnet" "hangaramqpt_private_subnet_1" {
#   vpc_id     = aws_vpc.default.id
#   cidr_block = "10.0.101.0/24"

#   tags = {
#     Name = "hangaramqpt_private_subnet_1"
#   }
# }
data "aws_subnet" "private__subnet_1" {
  id = "subnet-0d3e324b8a21c656e"
}
