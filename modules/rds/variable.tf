variable "private_subnet_ids" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}


variable "allocated_storage" {
  type = number
  
}
variable "max_allocated_storage" {
  type = number
}
variable "engine" {
  type = string
}
variable "engine_version" {
  type = string
}
variable "instance_class" {
  type = string
}
variable "username" {
  type = string
}
variable "password" {
  type = string
  sensitive = true
  
}
variable "publicly_accessible" {
  type = bool
}