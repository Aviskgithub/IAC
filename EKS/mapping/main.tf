resource "aws_internet_gateway" "createIG" {
  vpc_id = var.vpc_id
  tags = {
    "Name" = "IG-Terraform"
  }
}
resource "aws_eip" "createEIP" {
  tags = {
    "Name" = "ElasticIP-Terraform"
  }
}

resource "aws_route_table" "createpublicroute" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.createIG.id
  }
  tags = {
    "Name" = "Public Route table"
  }
}


resource "aws_route_table_association" "RT-public-association" {
  route_table_id = aws_route_table.createpublicroute.id
  count = length(var.public_subnet_cidr)
  subnet_id      = var.public_subnet_cidr[count.index]
}
