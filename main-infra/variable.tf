variable "trishala_vpc_cidr_block" {
  description = "cidr block for trishala vpc"
  type        = string
  default     = "10.0.0.0/16"

}

variable "public_subnet_cidr_block" {
  description = "public_subnet_cidr_block"
  type        = string
  default     = "10.0.0.0/24"

}

variable "private_subnet_cidr_block" {
  description = "private_subnet_cidr_block"
  type        = string
  default     = "10.0.1.0/24"

}

variable "availability_zone" {
  description = "availability_zone"
  type        = string
  default     = "ap-south-1a"

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
  default     = "t2.micro"

}

variable "key_name" {
  description = "Key pair name to use for the EC2 instance"
}