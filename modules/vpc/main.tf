# Create a VPC
resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "private_subnet" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = false
  tags {
    Name = "PrivateSubnet"
  }
}

resource "aws_subnet" "public_subnet" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone= "${data.aws_availability_zones.available.names[count.index]}"
   map_public_ip_on_launch = true
  tags {
    Name = "PublicSubnet"
  }
}
