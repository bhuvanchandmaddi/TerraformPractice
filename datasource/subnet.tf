provider "aws" {
  region     = "ap-southeast-1"
}

variable "vpc_id" {}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

resource "aws_subnet" "example" {
  vpc_id            = data.aws_vpc.selected.id
  availability_zone = "ap-southeast-1a"
  cidr_block        = "172.31.48.0/20"
}