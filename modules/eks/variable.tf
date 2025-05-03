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
variable "vpc_id" {
  description = "VPC ID for the EKS cluster"
  type        = string
}

variable "private_subnet_ids" {
    type = list(string)
  
}
variable "public_subnet_ids"{ 
  type = list(string)
}