output "trishala_vpc_id" {
  value = module.vpc.trishala_vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

output "trishala_sg_name" {
  value = module.sg.trishala_sg_name

}

output "trishala_sg_id" {
  value = module.sg.trishala_sg_id
}

output "jenkins_server_instance_id" {
  value = module.ec2.jenkins_server_instance_id
}


output "jenkins_server_public_ip" {
  value = module.ec2.jenkins_server_public_ip
}

output "ecr_repo_name" {
  value = module.ecr.ecr_repo_name
}

output "eks_cluster_name" {
  value = module.eks.eks_cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
}

output "eks_cluster_certificate_authority" {
  value = module.eks.eks_cluster_certificate_authority
}

output "eks_node_role_arn" {
  value = module.eks.eks_node_role_arn
}