resource "aws_vpc" "bmaddi_tf_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    CreatedBy = var.CreatedBy
    OwnedBy   = var.OwnedBy
  }
}
