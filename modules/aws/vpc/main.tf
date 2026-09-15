resource "aws_vpc" "dev_vpc" {
  cidr_block = var.cidr_block

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = var.public_subnet_cidr

  tags = {
    Name = "${var.name}-public-subnet"
  }
}