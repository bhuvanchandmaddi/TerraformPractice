# variables names
variable "vpc_cidr" {}
variable "CreatedBy" {
  type        = string
  default     = "terraform"
  description = "To identify resources created by terraform from UI"
}
variable "OwnedBy" {
  type        = string
  default     = "bmaddi"
  description = "Owner of the resource"
}
variable "pulic_subnets_cidrs" {
  type        = list(any)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "Cidr's of public subnets"
}
variable "private_subnets_cidrs" {
  type        = list(any)
  default     = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
  description = "Cidr's of private subnet"
}

variable "pulic_subnets_azs" {
  type        = list(any)
  default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  description = "Availability zone's of public subnets"
}
variable "private_subnets_azs" {
  type        = list(any)
  default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  description = "Avaiability Zone's of private subnet"
}
variable "key_name" {
  type        = string
  default     = "sample_key"
  description = "ssh key pair associated with ec2-user of ec2-instance"
}
