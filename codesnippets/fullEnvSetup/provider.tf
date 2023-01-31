terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
  encrypt = true   
  bucket = "bmaddi-tf-statefile"
  dynamodb_table = "terraform-state-lock-dynamo"
  key    = "terraform.tfstate"
  region = "ap-southeast-1"
  }
}