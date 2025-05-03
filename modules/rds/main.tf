

# Create a Security Group for RDS
resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Open access (use cautiously, better to restrict in production)
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Open access (use cautiously, better to restrict in production)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "rds-sg"
  }
}

# Create an RDS MySQL Instance
resource "aws_db_instance" "cbz_db_instance" {
  allocated_storage    = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class # Free-tier eligible instance type
  username             = var.username 
  password             = var.password
  parameter_group_name = "default.mysql8.0"
  publicly_accessible  = var.publicly_accessible
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet.name
  skip_final_snapshot  = true
  tags = {
    Name = "cbz-db-instance"
  }
}

# Create a DB Subnet Group using default subnets
resource "aws_db_subnet_group" "rds_subnet" {
  name       = "db-subnet-group-1"
subnet_ids = var.private_subnet_ids



  tags = {
    Name = "db-subnet-group"
  }
}
