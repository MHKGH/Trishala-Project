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