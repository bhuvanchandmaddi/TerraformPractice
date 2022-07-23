provider "aws" {
  region     = "ap-south-1"
  # we can use variable substitution in either of the ways
  # Former declaration was used in ealier and later was introducted in recent version
  # terraform supports backward compatability, so either of them can be used
  access_key = "${var.access_key}"
  secret_key = var.secret_key
}