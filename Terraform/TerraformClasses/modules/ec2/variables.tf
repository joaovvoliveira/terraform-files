variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "org_name" {
  default = "rocketseat"
}

variable "ec2_tags" {
    type = map(string)
    description = "Tags to be applied to EC2 Instance"
    default = {}
}
