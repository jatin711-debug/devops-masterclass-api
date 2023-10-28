terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ca-central-1"
}

module "backend_config" {
  source = "../../../modules/backend/s3/"

  bucket_name   = "nomad-terraform-state-jonathan-prod"
  dynamodb_name = "nomad-stage-terraform-state-lock-prod"
}

terraform {
    backend "s3" {
        bucket         = "nomad-terraform-state-jonathan-prod"
        key            = "global/s3/prod/terraform.tfstate"
        region         = "ca-central-1"
        dynamodb_table = "nomad-stage-terraform-state-lock-prod"
        encrypt        = true
    }
}