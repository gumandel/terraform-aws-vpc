resource "aws_vpc" "gustavo_vpc" {
  cidr_block = "172.105.0.0/16"

  tags = {
    Name = "gustavo-vpc"
  }
}
