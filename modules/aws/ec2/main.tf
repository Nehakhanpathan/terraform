resource "aws_instance" "vm" {

  instance_type = var.ec2_type
  ami = var.ami_type

  key_name = "r2k"
# !! we can use security_groups = ["sg-group name"]  if we want to use name !!
  subnet_id = var.subnet_id
  vpc_security_group_ids = [ aws_security_group.ec2_sg.id ]
  

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    delete_on_termination = true
    encrypted = true
    tags = {
      Name        = "vm-1-root-volume"
      Environment = "dev"
      Owner       = "rizwan"
    }
  }
# The directory where the current module's Terraform files are located."
# path.module is a built-in Terraform expression.

  user_data = file("${path.module}/user-data.sh")

  tags = { 
       name = "${var.name}-vm"
  }
}


resource "aws_security_group" "ec2_sg" {
  name = "ec2-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "tcp_all_ports" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_sg.id
}