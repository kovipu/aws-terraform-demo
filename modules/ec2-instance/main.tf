variable "ami" {
  description = "Amazon Machine Image for the instance. Default: Ubuntu 20.04."
  default     = "ami-06982ac8da9099c13"
}

variable "instance_type" {
  description = "Instance type for the machine."
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Name for the instance."
}

resource "aws_instance" "instance" {
  ami            = var.ami
  instance_type  = var.instance_type

  tags = {
    Name = var.instance_name
  }
}