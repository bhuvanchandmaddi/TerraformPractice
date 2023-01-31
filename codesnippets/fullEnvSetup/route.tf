resource "aws_route_table" "PublicRouteTable" {
  vpc_id = aws_vpc.bmaddi_tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bmaddi_tf_ig.id
  }
  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route_table" "PrivateRouteTable" {
  vpc_id = aws_vpc.bmaddi_tf_vpc.id

  tags = {
    Name = "PrivateRouteTable"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count=3
  subnet_id      = element(aws_subnet.public_subnets.*.id,count.index)
  route_table_id = aws_route_table.PublicRouteTable.id
}

resource "aws_route_table_association" "private_subnet_association" {
  count=3
  subnet_id      = element(aws_subnet.private_subnets.*.id,count.index)
  route_table_id = aws_route_table.PrivateRouteTable.id
}