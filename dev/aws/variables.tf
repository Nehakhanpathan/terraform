variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}  

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "cidr_block" {
  description = "VPC CIDR Range"
  type = string
}

variable "public_subnet_cidr" {
  type = string
}
