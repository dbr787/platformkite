terraform {
  backend "s3" {
    bucket         = "pbtf01-dev-tfstate-robz82sou3y3"
    key            = "pbtofu.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "pbtf01-dev-tfstate-lock"
  }
  required_providers {
    buildkite = {
      source  = "buildkite/buildkite"
      version = "~> 1.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.50.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }
  }
  required_version = ">= 1.8.3"
}

provider "buildkite" {
  # Must set the `BUILDKITE_API_TOKEN` environment variable
  # Must set the `BUILDKITE_ORGANIZATION_SLUG` environment variable
}

provider "aws" {
  # Must set the `AWS_PROFILE` environment variable
  # and `AWS_REGION` env var, too, profile ain't enough
}
