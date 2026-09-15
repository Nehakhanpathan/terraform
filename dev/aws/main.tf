module "vpc" {
  source = "../../modules/aws/vpc"

  name       = "${var.project_name}-${var.environment}"
  cidr_block = var.cidr_block
  public_subnet_cidr = var.public_subnet_cidr
}

module "ec2" {
  source = "../../modules/aws/ec2"
  name       = "${var.project_name}-${var.environment}"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
}
