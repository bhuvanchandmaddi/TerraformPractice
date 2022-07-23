resource "aws_vpc" "test_vpc"{
     cidr_block       = var.vpc_cidr
     enable_dns_hostnames = true
     tags={
        Name = "Terraform_vpc"
        Owner = "bmaddi"
     }
}

resource "aws_internet_gateway" "test_gateway" {
  vpc_id = aws_vpc.test_vpc.id
  tags={
        Name = "Terraform_ig"
        Owner = "bmaddi"
     }
}