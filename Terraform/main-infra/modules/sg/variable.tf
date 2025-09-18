variable "env" {
  description = "The environment for the resources"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {
    "Project" = "Trishala"
    "Owner"   = "Hemanth"
  }
}

variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
}

variable "my_ip" {
  description = "Your IP address in CIDR notation"
  type        = string
}