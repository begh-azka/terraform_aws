provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "my_terraform_vpc" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "tf_vpc"
  }
}

resource "aws_subnet" "tf_vpc_subnet1" {
  vpc_id     = aws_vpc.my_terraform_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "tf_subnet1"
  }
}
