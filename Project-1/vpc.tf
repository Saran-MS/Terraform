resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "Demo-VPC"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
  depends_on = [ aws_vpc.vpc ]
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  for_each = var.subnet_cidr
  cidr_block = each.value
  map_public_ip_on_launch = true

  tags = {
    Name = each.key
  }
  depends_on = [ aws_vpc.vpc ]
}