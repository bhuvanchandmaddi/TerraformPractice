resource "aws_vpc" "test_vpc"{
     cidr_block       = var.vpc_cidr
     enable_dns_hostnames = true
     tags={
        Name = var.vpc_name
        Owner = "bmaddi"
     }
}

resource "aws_internet_gateway" "test_gateway" {
  vpc_id = aws_vpc.test_vpc.id
  tags={
        Name = var.ig_name
        Owner = "bmaddi"
     }
}