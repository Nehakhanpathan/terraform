output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.dev_vpc.id
}

output "vpc_cidr_block" {
  description = "VPC CIDR block"
  value       = aws_vpc.dev_vpc.cidr_block
}

output "subnet_id" {
  value = aws_subnet.public.id
}