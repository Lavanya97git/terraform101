terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
  access_key = "AKIAxxxxxxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxxxxxxxx"
}
resource "aws_vpc" "awsVPClabel101" {
    cidr_block = "10.60.0.0/16"
    tags = {
      "key" = "myVPC101"
    }
}