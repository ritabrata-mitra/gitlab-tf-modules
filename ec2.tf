resource "aws_instance" "new_instance" {
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

#Define outpus of the module#
output "private_ip"{
  value = aws_instance.new_instance.private_ip
}

output "instance_id" {
  value= aws_instance.new_instance.id
}
