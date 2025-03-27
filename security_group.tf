resource "aws_security_group" "gustavo_sg_frontend" {
  name        = "gustavo-sg-frontend"
  description = "Grupo criado para configurar regras de ingress e outgoing"
  vpc_id      = aws_vpc.gustavo_vpc.id

  tags = {
    Name = "gustavo-sg-frontend"
  }
}

resource "aws_vpc_security_group_ingress_rule" "gustavo_allow_http" {
  security_group_id = aws_security_group.gustavo_sg_frontend.id
  cidr_ipv4         = ["0.0.0.0/0"]
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "gustavo_allow_ssh" {
  security_group_id = aws_security_group.gustavo_sg_frontend.id
  cidr_ipv4         = ["0.0.0.0/0"]
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "gustavo_allow_outgoing" {
  security_group_id = aws_security_group.gustavo_sg_frontend.id
  cidr_ipv4         = ["0.0.0.0/0"]
  ip_protocol       = "-1"
}
