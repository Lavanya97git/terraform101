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
  access_key = "AKIAxxxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}
resource "aws_instance" "AWS_VM101" {
    #ami - means amazon machine image
    ami = "ami-0e35ddab05955cf57"
    count = 2
    instance_type = "t2.micro"
}