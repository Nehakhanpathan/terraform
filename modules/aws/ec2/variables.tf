variable "ec2_type" {
    default = "t3.medium"
}

variable "ami_type" {
    default = "ami-00adafae70b8029d8"
}

variable "name" {
    description = "EC2 instance name"
    type        = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}