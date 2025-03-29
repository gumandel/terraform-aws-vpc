output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.gustavo_vpc.id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value = [
    aws_subnet.private_us_west_1b.id,
    aws_subnet.private_us_west_1c.id
  ]
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value = [
    aws_subnet.public_us_west_1b.id,
    aws_subnet.public_us_west_1c.id
  ]
}