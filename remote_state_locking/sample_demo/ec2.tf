resource "aws_instance" "demo_ec2" {
  count         = 2
  ami           = "ami-01cc34ab2709337aa"
  instance_type = "t2.micro"
  tags = {
    Name = "demo_state_ec2-${count.index}"
  }
}