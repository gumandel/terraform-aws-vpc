data "aws_ami" "this" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name = "name"
    values = ["al2023-ami-2023*"]
  }
}

resource "aws_instance" "gustavo_frontend" {
  instance_type = "t4.micro"
  ami           = "data.aws_ami.this.id"
  vpc_security_group_ids = [ aws_security_group.gustavo_sg_frontend.id ]
  subnet_id = aws_subnet.public_us_west_1b.id

  tags = {
    Name = "gustavo-frontend"
  }
}