terraform {
  required_version = "~> 1.0"

  required_providers {
    provider = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "remote" {
    organization = "${tfe_organization_name}"

    workspaces {
      name = "${tfe_workspace_name}"
    }
  }
}