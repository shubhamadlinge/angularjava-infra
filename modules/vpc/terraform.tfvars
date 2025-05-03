### vpc variable values
vpc_cidr   = "10.0.0.0/16"
public_subnet_cidr = ["10.0.2.0/24", "10.0.5.0/24"]
private_subnet_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
map_public_ip_on_launch = [ true ,false ]
az = [ "us-west-2a", "us-west-2b", "us-west-2c" ]
private_subnet_count = 2
public_subnet_count = 2