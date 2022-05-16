variable "vpc-cidr" {
  type = string
}
variable "subnet-cidr-Public" {
  type = map(string)
}
variable "subnet-cidr-Private" {
  type = map(string)
}