terraform {
  required_version = "~> 1.3.0"
  required_providers {
    aws = {
      version = "~> 3.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "terraform-state-demo-076"
    key            = "terra-backend/terraform.tfstate"
    encrypt        = true
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}
