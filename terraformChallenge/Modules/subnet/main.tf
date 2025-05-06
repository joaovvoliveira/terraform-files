resource "aws_subnet" "public_subnet" {
  count             = length(var.azs)
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  
  tags = {
    Name = "Main"
  }

}
