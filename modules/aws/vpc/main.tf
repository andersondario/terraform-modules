resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnets" {
  for_each = {
    "az1" = { "az_name" : "${var.region}a", "cidr" : "10.0.1.0/24" }
    "az2" = { "az_name" : "${var.region}b", "cidr" : "10.0.2.0/24" }
    "az3" = { "az_name" : "${var.region}c", "cidr" : "10.0.3.0/24" }
  }

  vpc_id     = aws_vpc.main.id
  cidr_block = each.value.cidr

  tags = {
    Name = "Subnet ${each.value.az_name}"
  }
}