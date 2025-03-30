output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.gustavo_vpc.id
}

output "private_us_west_1b" {
  value = aws_subnet.private_us_west_1b.id
}

output "private_us_west_1c" {
  value = aws_subnet.private_us_west_1c.id
}

output "public_us_west_1b" {
  value = aws_subnet.public_us_west_1b.id
}

output "public_us_west_1c" {
  value = aws_subnet.public_us_west_1c.id
}