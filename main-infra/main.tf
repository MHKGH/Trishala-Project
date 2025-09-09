module "vpc" {
  source                    = "./modules/vpc"
  trishala_vpc_cidr_block   = var.trishala_vpc_cidr_block
  public_subnet_cidr_block  = var.public_subnet_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
  availability_zone         = var.availability_zone

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
  subnet_id          = module.vpc.public_subnet_id
  key_name           = var.key_name

}

module "ecr" {
  source = "./modules/ecr"

}