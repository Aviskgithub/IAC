resource "aws_vpc" "create-vpc" {
  cidr_block = var.vpc-cidr
  tags = {
    "Name" = "VPC-Terraform"
  }
}

resource "aws_subnet" "create-subnet-public" {
  vpc_id     = aws_vpc.create-vpc.id
  for_each   = var.subnet-cidr-Public
  availability_zone = each.key
  cidr_block = each.value
  tags = {
    "Name" = "Subnet-Terraform-public"
  }
}

resource "aws_subnet" "create-subnet-private" {
  vpc_id     = aws_vpc.create-vpc.id
  for_each   = var.subnet-cidr-Private
   availability_zone = each.key
  cidr_block = each.value
  tags = {
    "Name" = "Subnet-Terraform-private"
  }
}
output "vpcid" {
  value = aws_vpc.create-vpc.id
}
output "publicsubnets" {
  value = aws_subnet.create-subnet-public
}
output "privatesubnets" {
  value = aws_subnet.create-subnet-private
}
