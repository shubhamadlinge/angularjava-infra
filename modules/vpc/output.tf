output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}




output "cbz_sg" {
  value = aws_security_group.cbz_sg.id
}

# output "private_subnet_ids" {
#   value = aws_subnet.private_subnet.id
  
# }
# output "private_subnet1" {
#   value = aws_subnet.private_subnet1.id
  
# }

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}
