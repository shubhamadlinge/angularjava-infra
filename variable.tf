### ec2 varable values
variable "instance_type" {
    description = "this variable contains instance type"
    type = string
}

variable "key" {
    description = "this variable contains key info"
    type = string
    default = "projectkey"
}
variable "root_volume_size" {
  description = "Root volume size in GB"
  type = number

}

variable "root_volume_type" {
  description = "Volume type for the root volume (e.g. gp2, gp3, io1)"
  type = string

}

variable "private_subnet_count" {
  type = number
}
variable "public_subnet_count"{ 
  type = number
}


###EKS
variable project {
    type = string
}
variable desired_nodes {
    type = number
}
variable max_nodes {
    type = number
}
variable min_nodes {
    type = number
}
variable node_instance_type {
    type = string
}
## rds
# variable "vpc_id" {
#   type = string
# }

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
###vpc
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