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

  bucket_name   = "nomad-terraform-state-jonathan-stage"
  dynamodb_name = "nomad-stage-terraform-state-lock"
}

terraform {
    backend "s3" {
        bucket         = "nomad-terraform-state-jonathan-stage"
        key            = "global/s3/stage/terraform.tfstate"
        region         = "ca-central-1"
        dynamodb_table = "nomad-stage-terraform-state-lock"
        encrypt        = true
    }
}