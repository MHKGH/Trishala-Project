module "vpc" {
  source                      = "./modules/vpc"
  trishala_vpc_cidr_block     = var.trishala_vpc_cidr_block
  public_subnet_cidr_block_1  = var.public_subnet_cidr_block_1
  public_subnet_cidr_block_2  = var.public_subnet_cidr_block_2
  private_subnet_cidr_block_1 = var.private_subnet_cidr_block_1
  private_subnet_cidr_block_2 = var.private_subnet_cidr_block_2
  availability_zone_1         = var.availability_zone_1
  availability_zone_2         = var.availability_zone_2

}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.trishala_vpc_id
  my_ip  = var.my_ip
}

module "ec2" {
  source             = "./modules/ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  security_group_ids = [module.sg.trishala_sg_id]
  subnet_id          = module.vpc.public_subnet_ids[0]
  key_name           = var.key_name

}

module "ecr" {
  source = "./modules/ecr"

}

module "eks" {
  source             = "./modules/eks"
  cluster_name       = var.cluster_name
  subnet_ids         = var.subnet_ids
  node_instance_type = var.node_instance_type
  desired_capacity   = var.desired_capacity
  min_capacity       = var.min_capacity
  max_capacity       = var.max_capacity
}