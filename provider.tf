provider "aws" {
  region  = "eu-west-1"
  profile = "Devm8"
}

terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.8.0"
    }
  }

  required_version = "~> 1.0"
}
