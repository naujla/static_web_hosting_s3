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

variable "s3_bucket"{
  default = "aws-s3-bucket-32123454323"
  type = string
  
}



