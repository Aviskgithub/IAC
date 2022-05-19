provider "aws" {
  region = var.region
}


module "vpc" {
  source = "./vpc"
  vpc-cidr = var.vpc-cidr
  subnet-cidr-Public = var.subnet-cidr-Public
}

module "mapping" {
  depends_on = [
    module.vpc
  ]
  source = "./mapping"
  vpc_id = module.vpc.vpcid
  public_subnet_cidr = [for x, y in module.vpc.publicsubnets : y.id ]
}
output "publicsubnetid" {
  value = [for x, y in module.vpc.publicsubnets : y.id ]
}

output "vpcid" {
  value = module.vpc.vpcid
}









