
variable "public_subnet_cidr" {
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_id" {
  type = string
  default = "vpc-0ef2191bef28e660d"
}

variable "azs" {
  type = list(string)
}

variable "subnet_cidrs" {
  type = list(string)
}
