resource "aws_vpc" "shared_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "shared-vpc"
  }
}
