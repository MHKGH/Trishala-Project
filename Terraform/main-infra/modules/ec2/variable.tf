variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
}

variable "security_group_ids"{
  description = "Security group ID to associate with the EC2 instance"
}

variable "subnet_id" {
  description = "Subnet ID to launch the EC2 instance in"
}

variable "key_name" {
  description = "Key pair name to use for the EC2 instance"
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
