resource "aws_vpc" "gustavo_vpc" {
  cidr_block = "172.105.0.0/16"
  tags = {
    Name = "gustavo-vpc"
  }
}

resource "aws_subnet" "private_us_west_1b" {
  vpc_id            = aws_vpc.gustavo_vpc.id
  cidr_block        = "172.105.1.0/24"
  availability_zone = "us-west-1b"
  tags = {
    "Name" = "gustavo-private-us-west-1b"
  }
}

resource "aws_subnet" "private_us_west_1c" {
  vpc_id            = aws_vpc.gustavo_vpc.id
  cidr_block        = "172.105.2.0/24"
  availability_zone = "us-west-1c"
  tags = {
    "Name" = "gustavo-private-us-west-1c"
  }
}

resource "aws_subnet" "public_us_west_1b" {
  vpc_id                  = aws_vpc.gustavo_vpc.id
  cidr_block              = "172.105.3.0/24"
  availability_zone       = "us-west-1b"
  tags = {
    "Name" = "gustavo-public-us-west-1b"
  }
}

resource "aws_subnet" "public_us_west_1c" {
  vpc_id                  = aws_vpc.gustavo_vpc.id
  cidr_block              = "172.105.4.0/24"
  availability_zone       = "us-west-1c"
  tags = {
    "Name" = "gustavo-public-us-west-1c"
  }
}

resource "aws_internet_gateway" "gustavo_igw" {
  vpc_id = aws_vpc.gustavo_vpc.id
  tags = {
      Name = "gustavo-igw"
  }
}

resource "aws_route_table" "gustavo_public" {
  vpc_id = aws_vpc.gustavo_vpc.id

  route {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.gustavo_igw.id
    }

  tags = {
    Name = "gustavo-pub-rt"
    Owner = "Gustavo"
  }
}

resource "aws_route_table_association" "public-1b-association" {
  subnet_id      = aws_subnet.public_us_west_1b.id
  route_table_id = aws_route_table.gustavo_public.id
}

resource "aws_route_table_association" "public-1c-association" {
  subnet_id      = aws_subnet.public_us_west_1c.id
  route_table_id = aws_route_table.gustavo_public.id
}