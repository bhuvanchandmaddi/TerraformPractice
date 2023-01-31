resource "aws_internet_gateway" "bmaddi_tf_ig" {
  vpc_id = aws_vpc.bmaddi_tf_vpc.id

  tags = {
    CreatedBy = var.CreatedBy
    OwnedBy   = var.OwnedBy
  }
}
