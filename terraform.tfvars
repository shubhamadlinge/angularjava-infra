## ec2 variable values
instance_type = "t2.large"
key = "projectkey"
root_volume_size = 30
root_volume_type = "gp2"
### eks variable values
project = "cbz"
desired_nodes = 2
max_nodes  = 2
min_nodes  = 2
node_instance_type = "t3.medium"
## values of rds variables
public_subnet_cidr = ["10.0.2.0/24", "10.0.5.0/24"]
private_subnet_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
allocated_storage = 20
max_allocated_storage = 100
engine = "mysql"
engine_version = "8.0"
instance_class = "db.t3.micro"
username = "admin"
password = "Shubham123"
publicly_accessible = false
### vpc variable values
vpc_cidr   = "10.0.0.0/16"
# public_subnet_cidr = "10.0.2.0/24"
# private_subnet_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
map_public_ip_on_launch = [ true ,false ]
az = [ "us-west-2a", "us-west-2b", "us-west-2c" ]
private_subnet_count = 2
public_subnet_count = 2