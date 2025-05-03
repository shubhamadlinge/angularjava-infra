resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  count = var.public_subnet_count
  availability_zone = var.az[count.index]
  cidr_block = var.public_subnet_cidr[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch[0]
  tags = {
    Name = "private-subnet-${count.index}"
  }
  
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
      Name = "igw"
    }

}

# Add a route to the Internet Gateway in the default route table
resource "aws_default_route_table" "default" {
  default_route_table_id = aws_vpc.main.default_route_table_id
}

resource "aws_route" "route_to_internet" {
  route_table_id         = aws_default_route_table.default.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
# Associate the route table with the default subnet
resource "aws_route_table_association" "default_association" {
  subnet_id      = aws_subnet.public[0].id # Add your subnet ID here
  route_table_id = aws_default_route_table.default.id

}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  count = var.private_subnet_count
  availability_zone = var.az[count.index]
  cidr_block = var.private_subnet_cidr[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch[1]
  tags = {
    Name = "private-subnet-${count.index}"
  }
  
}
# resource "aws_subnet" "private_subnet1" {
#   vpc_id = aws_vpc.main.id
#   availability_zone = var.map_public_ip_on_launch[1]
#   cidr_block = var.private_subnet_cidr[1]
#   map_public_ip_on_launch = var.map_public_ip_on_launch[1]
  
# }

resource "aws_security_group" "cbz_sg" {
  name        = "cbz_security_group"
  description = "Allow SSH, HTTP, and jenkins"
  vpc_id      = aws_vpc.main.id  # Reference to your VPC module output

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow HTTPs"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "cbz-sg"
  }
}


