variable "region" {
  default = "us-east-1"
  type    = string
}


# variables.tf

variable "region_tags" {
  description = "A map of common tags to be applied to resources"
  type        = map(string)
  default     = {
    managedBy   = "Terraform"
    environment = "Development"
  }
}





