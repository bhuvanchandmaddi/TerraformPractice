resource "aws_flow_log" "vpcflowlogs" {
  # implicit dependency ->  arn is attribute reference of s3   
  log_destination      = aws_s3_bucket.statebucket.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  #Even vpc_id is implicit dependecy, because id is the attribute reference of vpc
  vpc_id = aws_vpc.test_vpc.id
  tags = {
    CreatedBy  = "Terraform"
    Owner = "bmaddi"
    Name = "Terraform Flow log"
  }
}

