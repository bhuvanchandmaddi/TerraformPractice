resource "aws_subnet" "public_subnets" {
  count                   = 3
  vpc_id                  = aws_vpc.bmaddi_tf_vpc.id
  availability_zone       = element(var.pulic_subnets_azs, count.index)
  cidr_block              = element(var.pulic_subnets_cidrs, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name      = "public-subnet-${count.index + 1}"
    CreatedBy = var.CreatedBy
    OwnedBy   = var.OwnedBy
  }
}
resource "aws_subnet" "private_subnets" {
  count                   = 3
  vpc_id                  = aws_vpc.bmaddi_tf_vpc.id
  availability_zone       = element(var.private_subnets_azs, count.index)
  cidr_block              = element(var.private_subnets_cidrs, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name      = "private-subnet-${count.index + 1}"
    CreatedBy = var.CreatedBy
    OwnedBy   = var.OwnedBy
  }
}
