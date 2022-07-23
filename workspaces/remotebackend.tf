# stores terraform state files in s3 bucket

terraform {
  backend "s3" {
    #give existing bucket
    bucket = "bmaddi-terraform-test"
    key    = "myterraform.tfstate"
    region = "ap-south-1"
  }
}