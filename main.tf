module "vpc" {
  source = "./modules/vpc"
  private_subnet_count = var.private_subnet_count
  public_subnet_count = var.public_subnet_count
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  map_public_ip_on_launch = var.map_public_ip_on_launch
  az = var.az

}


module "rds" {
    source = "./modules/rds"
    vpc_id = module.vpc.vpc_id
    allocated_storage = var.allocated_storage
    max_allocated_storage = var.max_allocated_storage
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.instance_class
    username = var.username
    password = var.password
    publicly_accessible = var.publicly_accessible
    private_subnet_ids = module.vpc.private_subnet_ids
}

module "eks" {
    source = "./modules/eks"
    vpc_id = module.vpc.vpc_id
    private_subnet_ids =  module.vpc.private_subnet_ids
    public_subnet_ids = module.vpc.public_subnet_ids
    project = var.project
    desired_nodes = var.desired_nodes
    max_nodes  = var.max_nodes
    min_nodes  = var.min_nodes
    node_instance_type = var.node_instance_type
}

module "s3" {
    source = "./modules/s3"
}

module "ec2" {
  source = "./modules/ec2"
  aws_security_group = [module.vpc.cbz_sg]
  public_subnet_id = module.vpc.public_subnet_ids[0]
  root_volume_size = var.root_volume_size
  root_volume_type = var.root_volume_type
  instance_type    = var.instance_type
  key = var.key
  
}
  

