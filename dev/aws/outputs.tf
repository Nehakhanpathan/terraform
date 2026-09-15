output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "ec2_id" {
  description = "EC2 ID"
  value       = module.ec2.ec2_id
}
