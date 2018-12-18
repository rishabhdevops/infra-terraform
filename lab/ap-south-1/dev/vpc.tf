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
