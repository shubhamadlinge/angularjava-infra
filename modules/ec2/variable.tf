variable "public_subnet_id" {}

variable "aws_security_group" {
  type = list(string)
}

variable "root_volume_size" {
  type = number
}

variable "root_volume_type" {
  type = string
}

variable "instance_type" {
  type = string
}
variable "key" {
  
}
