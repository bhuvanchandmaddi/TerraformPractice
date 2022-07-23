resource "aws_s3_bucket" "statebucket" {

  # name of bucket which we can see in s3 ui  
  bucket = "bmaddi-terraform-test"
  tags = {
    Owner     = "bmaddi"
    createdBy = "Terraform"
  }

 depends_on = [
   aws_vpc.test_vpc
 ]
}

resource "aws_s3_bucket_acl" "bmaddi-acl" {
  bucket = aws_s3_bucket.statebucket.id
  acl    = "private"
}