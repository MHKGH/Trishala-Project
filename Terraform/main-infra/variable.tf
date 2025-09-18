variable "trishala_vpc_cidr_block" {
  description = "Trishala project VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block_1" {
  description = "public_subnet_cidr_block_1"
  type        = string
  default     = "10.0.0.0/24"
}

variable "public_subnet_cidr_block_2" {
  description = "public_subnet_cidr_block_2"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block_1" {
  description = "public_subnet_cidr_block"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_cidr_block_2" {
  description = "public_subnet_cidr_block"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_cidr_block" {
  description = "private_subnet_cidr_block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone_1" {
  description = "availability_zone"
  type        = string
  default     = "ap-south-1a"
}

variable "availability_zone_2" {
  description = "availability_zone"
  type        = string
  default     = "ap-south-1b"
}


variable "my_ip" {
  description = "Your IP address in CIDR notation"
  type        = string

}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"

}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.large"

}

variable "key_name" {
  description = "Key pair name to use for the EC2 instance"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.small"
}

variable "desired_capacity" {
  description = "Desired number of nodes in the node group"
  type        = number
  default     = 2
}

variable "min_capacity" {
  description = "Minimum number of nodes in the node group"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "Maximum number of nodes in the node group"
  type        = number
  default     = 3
}
