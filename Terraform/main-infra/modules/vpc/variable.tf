variable "trishala_vpc_cidr_block" {
  description = "Trishala project VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "tags" {
  description = "Common tag"
  type        = map(string)
  default = {
    "Project" = "Trishala"
    "Owner"   = "Hemanth"
  }
}

variable "env" {
  description = "Env tag"
  type        = string
  default     = "dev"
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
