terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"  # Ensure you have a version that supports this configuration
    }
  }
}
provider "aws" {
    region = "us-west-2"
    profile = "shubham"
}


