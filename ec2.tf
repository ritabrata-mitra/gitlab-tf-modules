resource "aws_instance" "server1" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.name
  }
  key_name = var.key_name
}

#Define inputs for using the module #
variable "name" {}
variable "instance_type" {}
variable "key_name" {}
variable "ami" {}
