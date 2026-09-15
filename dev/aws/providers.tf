terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  access_key = "AKIATCKASAFXBOANK4MZ"
  secret_key = "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"

  default_tags {
    tags = {
      Environment = var.environment
      ManagedBy   = "Terraform"
      Project     = var.project_name
    }
  }
}