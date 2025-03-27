resource "aws_route_table" "gustavo_public" {
  vpc_id = aws_vpc.gustavo_vpc.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.gustavo_igw.id
    },
  ]

  tags = {
    Name = "gustavo-pub-rt"
    Owner = "Gustavo"
  }
}

resource "aws_route_table_association" "public-us-west-1b" {
  subnet_id      = aws_subnet.public-us-west-1b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-us-west-1c" {
  subnet_id      = aws_subnet.public-us-west-1c.id
  route_table_id = aws_route_table.public.id
}
