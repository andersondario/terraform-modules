terraform {
  required_providers {
    google = "4.10.0"
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.53.0"
    }
  }

  backend "remote" {
    organization = "andersondario"
    workspaces {
      name = "dev"
    }
  }
}

provider "google" {
  project = "aa-dev-env"
  region  = "us"
}

provider "hcp" {}