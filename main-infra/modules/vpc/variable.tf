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


variable "public_subnet_cidr_block" {
  description = "public_subnet_cidr_block"
  type        = string
  default     = "10.0.0.0/24"
}

variable "availability_zone" {
  description = "availability_zone"
  type        = string
  default     = "ap-south-1a"
}

variable "private_subnet_cidr_block" {
  description = "private_subnet_cidr_block"
  type        = string
  default     = "10.0.1.0/24"
}