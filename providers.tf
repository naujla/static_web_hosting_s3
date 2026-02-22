terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.32.1"
    }
  }
}

#Confirgure AWS provider
provider "aws" {
  region = var.region
  default_tags {
    tags = var.region_tags
  }
}
