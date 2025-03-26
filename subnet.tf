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
