resource "aws_eip" "gustavo_nat" {
  vpc = true

  tags = {
    Name = "gustavo-nat"
  }
}

resource "aws_nat_gateway" "gustavo_nat"
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-us-west-1b.id

  tags = {
    Name = "gustavo-nat"
  }

  depends_on = [aws_internet_gateway.gustavo_igw]
}
