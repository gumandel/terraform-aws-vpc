data "aws_ami" "imagem_ec2" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "al2023-ami-2023.*-x86_64" ]
  }
}

module "vpc" {
    source = "../vpc"
    project_name = "gustavo_vpc"
}

module "loadbalancer" {
    source = "../loadbalancer"
    public_us_west_1b = module.vpc.public_us_west_1b
    public_us_west_1c = module.vpc.public_us_west_1c
    vpc_id = module.vpc.vpc_id
}

resource "aws_instance" "gustavo_backend_1" {
    instance_type = "t3.micro"
    ami           = data.aws_ami.imagem_ec2.id
    count         = 1
    subnet_id = var.private_us_west_1b
    tags = {
        Name = "gustavo-backend-1-ec2"
    }
}

resource "aws_instance" "gustavo_backend_2" {
    instance_type = "t3.micro"
    ami           = data.aws_ami.imagem_ec2.id
    count         = 1
    subnet_id = var.private_us_west_1c
    tags = {
        Name = "gustavo-backend-2-ec2"
    }
}