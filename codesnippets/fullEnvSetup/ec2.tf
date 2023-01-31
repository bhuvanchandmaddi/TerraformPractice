resource "aws_instance" "ec2_instances" {
  count                       = 3
  ami                         = "ami-0753e0e42b20e96e3" # ap-south-east1
  instance_type               = "t2.micro"
  # if you create the key using terraform, uncomment these 2 lines
  # keyname = aws_key_pair.key_name.id
  key_name                    = var.key_name
  associate_public_ip_address = true
  subnet_id                   = element(aws_subnet.public_subnets.*.id, count.index)
  security_groups             = ["${aws_security_group.allow_all.id}"]
  tags = {
    Name      = "terraform-instance-${count.index + 1}"
    CreatedBy = var.CreatedBy
    ownedBy   = var.OwnedBy
  }
}
# resource "aws_key_pair" "key_name" {
#   key_name   = var.key_name
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZUFrclme0AoVipOqatP76zXat6qOOrg3+anwFiymmkf7WY3zX4fHakqXj6ti97edM4NC/tve71ReMUNm44PeaXxyGdZ93E8JQIedcyagofZppjAbu+31VPLCMGmc+cP32GcpYM3WOSAj9yTSyCG/e+tg4iIDc8Hmmf4Ov4hB8tjnzLKU/gFnUgi+OuOyhYEFGTJ1HRY8nGFfIAs7lCzp70gR2q+SKIQmfgql/CEUZQFUVHSnt/dShRaIuqi5i1PSb8RBkCX71u53trdCSq41qDFhAesARXxJmY89e79itn7w3pI6T35QiMs7RVX/PW3WVy66czjUaDBW/kwgjKH+r sample_key"
# }
