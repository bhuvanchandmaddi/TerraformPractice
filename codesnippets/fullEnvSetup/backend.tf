
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "statefile_bucket" {

  bucket = "bmaddi-tf-statefile"
  tags = {
    Name      = "tf_statefile_loc"
    CreatedBy = "Terraform"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.statefile_bucket.id
  acl    = "private"
}
