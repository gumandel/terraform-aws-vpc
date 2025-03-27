resource "aws_internet_gateway" "gustavo_igw" {
  vpc_id = aws_vpc.gustavo_vpc.id

  tags = {
      Name = "gustavo-igw"
  }
}
