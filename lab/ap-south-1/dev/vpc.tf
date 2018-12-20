resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.instance_tanancy}"


   tags = {
    Name        = "${var.environment}"
    environment = "${var.environment}"
    project     = "infrastructure"
    team        = "RS"
    application = "vpc"
  }
}

#public subnet
resource "aws_subnet" "public subnet" {
vpc_id = "$(vpc.default.id}"
cidr_block = "${var.public_subnet_cidr}"
availability_zone = "${var.environment}"

tags {
  Name = "public subnet"
 }
}


#private subnet
resource "aws_subnet" "private subnet" {
vpc_id = "$(vpc.default.id}"
cidr_block = "${var.private_subnet_cidr}"
availability_zone = "${var.environment}"

tags {
  Name = "private subnet"
 }
}

#Internet Accessgateway
resource "internet_gateway" "gw" {
  vpc_id = "${vpc.default.id}"

  tags {
    Name = "VPC IGW"
  }
}

#Routetable
resource "aws_route_table" "web-public-rt" {
  vpc_id = "${vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${internet_gateway.gw.id}"
  }

  tags 
    Name = "Public Subnet RT"
  }

# Assign the route table to the public Subnet
resource "route_table_association" "web-public-rt" {
  subnet_id = "${subnet.public-subnet.id}"
  route_table_id = "${route_table.web-public-rt.id}"
}
