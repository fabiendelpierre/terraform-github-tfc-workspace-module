# terraform-github-tfc-workspace-module

Creates an empty GitHub repository (blank or from a specified template) and a corresponding workspace in Terraform Cloud.

## Requirements

After setting up the GitHub repo + TFC workspace, you must set a secret in your GitHub repo called `TFC_API_TOKEN` and set its value to a personal token obtained from Terraform Cloud. This is required for the GitHub Action that runs Terraform on your behalf.

## Inputs and outputs

<!--- BEGIN_TF_DOCS --->

<!--- END_TF_DOCS --->

## Code example

```hcl
terraform {
  required_version = "~> 1.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.1"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.26"
    }
  }
}

provider "github" {
  token = "..."
}

provider "tfe" {
  token = "..."
}

# module "test" {
#   source = "github.com/fabiendelpierre/terraform-github-tfc-workspace-module"

#   github_repo_name        = "foo"
#   github_repo_description = "..."

#   github_repo_use_template        = true
#   github_repo_template_owner_name = "owner-org"
#   github_repo_template_repo_name  = "template-repo-name"

#   tfc_workspace_name    = "foo"
#   tfc_organization_name = "tfc-org-name"

#   tfc_workspace_terraform_version = "1.0.7"
# }
```