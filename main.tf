terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }

  # Sync file terraform.tfstate on S3 Bucket
  backend "s3" {
    bucket = "bucket-s3-jcendrette-414860898158"
    key    = "state/terraform.tfstate"
    region = "us-east-1"

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

