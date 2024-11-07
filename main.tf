terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      environment = "dev"
      author      = "José Cendrette"
      project     = "terraform-aws-ada"
    }
  }
}

