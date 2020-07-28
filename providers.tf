# Define AWS as our provider
provider "aws" {
    region        = "eu-central-1"
}

# Terraform remote state
terraform {
    backend "s3" {
        bucket    = "terraform-s3-bucket-testing"
        key       = "terraform-s3-bucket-testing/terraform.tfstate"
        region    = "eu-central-1"
  }
}
