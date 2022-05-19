variable "region" {
  type = string
  description = "Region to work in"
}
variable "vpc-cidr" {
  type        = string
  description = "CIDR for VPC"
}
variable "subnet-cidr-Public" {
  type        = map(string)
  description = "CIDR block list for subnet"
}
