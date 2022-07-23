variable access_key {
    type = string
    default = ""
    description = "Enter your access key"
}

variable secret_key {
    type = string
    default = ""
    description = "Enter your Secret key"
}

variable vpc_cidr {
   type = string
   default = "10.50.0.0/16"
   description = "Vpc cidr range"
}

variable public_subnet1_name {
    type = string
    default = "Test_Subnet1"
    description = "Name of the subnet 1"
}

variable public_subnet2_name {
    type = string
    default = "Test_Subnet2"
    description = "Name of the subnet 2"
}

variable public_subnet1_cidr {
    type = string
    default = "10.50.1.0/24"
    description = "Cidr range of subnet 1"
}

variable public_subnet2_cidr {
    type = string
    default = "10.50.2.0/24"
    description = "Cidr range of subnet 2 "
}