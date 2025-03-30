data "aws_ami" "imagem_ec2" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "al2023-ami-2023.*-x86_64" ]
  }
}

resource "aws_security_group" "gustavo_nginx_sg" {
  name        = "gustavo-sg-frontend"
  description = "Grupo criado para configurar regras de ingress e outgoing"
  # vpc_id      = var.gustavo_vpc.id
  vpc_id      = var.vpc_id

  tags = {
    Name = "gustavo-nginx-sg"
  }
}

resource "aws_security_group_rule" "gustavo_allow_http" {
  security_group_id = aws_security_group.gustavo_nginx_sg.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "gustavo_allow_ssh" {
  security_group_id = aws_security_group.gustavo_nginx_sg.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "gustavo_allow_outgoing" {
  security_group_id = aws_security_group.gustavo_nginx_sg.id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
}

resource "aws_network_interface" "gustavo_nginx_ei" {
  subnet_id = var.public_us_west_1b
  tags = {
    Name = "gustavo-nginx-ei"
  }
}

resource "aws_instance" "gustavo_nginx_ec2" {
  instance_type = "t3.micro"
  ami = data.aws_ami.imagem_ec2.id
  subnet_id = var.public_us_west_1b
  vpc_security_group_ids = [ aws_security_group.gustavo_nginx_sg.id ]
  user_data = file("${path.module}/user-data.sh")

  associate_public_ip_address = true
  tags = {
    Name = "gustavo-nginx-ec2"
  }
}