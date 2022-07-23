resource "aws_subnet" "Test_subnet1" {
  cidr_block        = var.public_subnet1_cidr
  vpc_id            = aws_vpc.test_vpc.id
  availability_zone = "ap-south-1a"
  tags = {
    Name = var.public_subnet1_name
  }
  depends_on = [
    aws_flow_log.vpcflowlogs,
    aws_internet_gateway.test_gateway
  ]
}

resource "aws_subnet" "Test_subnet2" {
  cidr_block        = var.public_subnet2_cidr
  vpc_id            = aws_vpc.test_vpc.id
  availability_zone = "ap-south-1b"
  tags = {
    Name = var.public_subnet2_name
  }
  depends_on = [
    aws_flow_log.vpcflowlogs,
    aws_subnet.Test_subnet1
  ]
}
