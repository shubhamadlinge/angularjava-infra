## ec2
output "public_ip" {
  value = module.ec2.public_ip
  
}
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "cbz_sg" {
  value = module.vpc.cbz_sg
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
  
}
# output "private_subnet1" {
#   value =  module.vpc.private_subnet1

# }

output "eks_name" {
  value = module.eks.eks_name
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}
output "website_url" {
  value = module.s3.website_url
}
