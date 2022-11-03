resource "aws_instance" "new_instance" {
  region = var.region
  vpc = var.vpc_id
  subnet = var.subnet_id
  publicip = false
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  for_each           = toset(var.sg_name)
  security_groupname = each.value
  tags = {
    Name = var.name
  }
}

#Define inputs for using the module #

variable "region" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "sg_name" {}
variable "name" {}

#Define outpus of the module#

output "private_ip"{
  value = aws_instance.new_instance.private_ip
}
