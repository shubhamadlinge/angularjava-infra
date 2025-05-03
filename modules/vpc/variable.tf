variable "vpc_cidr" {
    type = string
}
variable "public_subnet_cidr" {
type = list(string)
}
variable "private_subnet_cidr"{
    type = list(string)
}
variable "map_public_ip_on_launch"{
    type = list(bool)
}
variable "az" {
    type = list(string)
  
}
variable "private_subnet_count" {
  description = "Number of private subnets"
  type        = number
}
variable "public_subnet_count"{ 
  description = "Number of public subnets"
  type        = number
}
