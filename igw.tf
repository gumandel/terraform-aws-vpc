resource "aws_internet_gateway" "gustavo_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
      Name = "gustavo-igw"
  }
}
