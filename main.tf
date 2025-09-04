terraform {
  #apply aws provider in terraform
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.11.0"
    }
  }
  #apply s3 backend on aws account 
  backend "s3" {
    bucket = "terraform-s3-ci"
    key    = "statecollection"
    region = "ap-south-1"
  }
}

provider "aws" {
  # Configuration options for provider setup
  region = var.aws_provider_region
}

module "jenkins-lab-dev" {
  source = "./modules/dev"
}

module "jenkins-lab-prod" {
  source = "./modules/prod"
}