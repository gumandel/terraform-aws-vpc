output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value = [
    aws_subnet.private-us-west-1a.id,
    aws_subnet.private-us-west-1b.id
  ]
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value = [
    aws_subnet.public-us-west-1a.id,
    aws_subnet.public-us-west-1b.id
  ]
}

output "private_subnet_cidr_blocks" {
  description = "The CIDR blocks of the private subnets"
  value = [
    aws_subnet.private-us-west-1a.cidr_block,
    aws_subnet.private-us-west-1b.cidr_block
  ]
}

output "public_subnet_cidr_blocks" {
  description = "The CIDR blocks of the public subnets"
  value = [
    aws_subnet.public-us-west-1a.cidr_block,
    aws_subnet.public-us-west-1b.cidr_block
  ]
}
