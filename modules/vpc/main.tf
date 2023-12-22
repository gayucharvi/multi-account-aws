# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "vpcnew"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.example.id
  cidr_block = var.private_subnet_cidr
  availability_zone="ap-south-1a"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "subnet_private"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.example.id
  cidr_block = var.public_subnet_cidr
  availability_zone="ap-south-1a"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "subnet_public"
  }
}
