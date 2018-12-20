variable "environment" {
  default = "dev"
}


# VPC Variables
variable "vpc_cidr" {
  default = "10.1.0.0/16"
}


variable "instance_tanancy" {
  default = "default"
}

variable "public_subnet_cidr" {
 description = "CIDR for the public subnet"
 default = "10.1.1.0/24"
}

variable "private_subnet_cidr" {
 description = "CIDR for the private subnet"
 default = "10.1.2.0/24"
}
