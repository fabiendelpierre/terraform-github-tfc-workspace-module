# terraform-github-tfc-workspace-module

Creates an empty GitHub repository (blank or from a specified template) and a corresponding workspace in Terraform Cloud.

## Requirements

After setting up the GitHub repo + TFC workspace, you must set a secret in your GitHub repo called `TFC_API_TOKEN` and set its value to a personal token obtained from Terraform Cloud. This is required for the GitHub Action that runs Terraform on your behalf.

## Inputs and outputs

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 4.1.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.26.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | >= 4.1.0 |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | >= 0.26.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository.blank](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.templated](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_file.blank_providers_tf](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.templated_providers_tf](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [tfe_workspace.main](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_repo_description"></a> [github\_repo\_description](#input\_github\_repo\_description) | A description for the GitHub repo | `string` | `""` | no |
| <a name="input_github_repo_enable_issues"></a> [github\_repo\_enable\_issues](#input\_github\_repo\_enable\_issues) | value | `bool` | `true` | no |
| <a name="input_github_repo_enable_projects"></a> [github\_repo\_enable\_projects](#input\_github\_repo\_enable\_projects) | value | `bool` | `false` | no |
| <a name="input_github_repo_enable_wiki"></a> [github\_repo\_enable\_wiki](#input\_github\_repo\_enable\_wiki) | value | `bool` | `false` | no |
| <a name="input_github_repo_gitignore_template"></a> [github\_repo\_gitignore\_template](#input\_github\_repo\_gitignore\_template) | A gitignore template to preinstall in the GitHub repo | `string` | `"Terraform"` | no |
| <a name="input_github_repo_license_template"></a> [github\_repo\_license\_template](#input\_github\_repo\_license\_template) | The license to apply to the GitHub repository | `string` | `"unlicense"` | no |
| <a name="input_github_repo_name"></a> [github\_repo\_name](#input\_github\_repo\_name) | The name of the GitHub repo | `string` | n/a | yes |
| <a name="input_github_repo_template_owner_name"></a> [github\_repo\_template\_owner\_name](#input\_github\_repo\_template\_owner\_name) | The owner organization of the template repo to use to create this repo | `string` | `""` | no |
| <a name="input_github_repo_template_repo_name"></a> [github\_repo\_template\_repo\_name](#input\_github\_repo\_template\_repo\_name) | The name of the template repo to use to create this repo | `string` | `""` | no |
| <a name="input_github_repo_use_template"></a> [github\_repo\_use\_template](#input\_github\_repo\_use\_template) | Use a template to create the GitHub repo | `bool` | `true` | no |
| <a name="input_github_repo_visibility"></a> [github\_repo\_visibility](#input\_github\_repo\_visibility) | The GitHub repo's visibility (public, private, or internal) | `string` | `"public"` | no |
| <a name="input_tfc_organization_name"></a> [tfc\_organization\_name](#input\_tfc\_organization\_name) | The name of the Terraform Cloud organization to which the workspace belongs | `string` | n/a | yes |
| <a name="input_tfc_workspace_name"></a> [tfc\_workspace\_name](#input\_tfc\_workspace\_name) | The name of the workspace in Terraform Cloud | `string` | n/a | yes |
| <a name="input_tfc_workspace_terraform_version"></a> [tfc\_workspace\_terraform\_version](#input\_tfc\_workspace\_terraform\_version) | The version of Terraform to use during the workspace's runs | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_github_repo_full_name"></a> [github\_repo\_full\_name](#output\_github\_repo\_full\_name) | n/a |
| <a name="output_github_templated_repo_full_name"></a> [github\_templated\_repo\_full\_name](#output\_github\_templated\_repo\_full\_name) | n/a |
| <a name="output_tfc_workspace_id"></a> [tfc\_workspace\_id](#output\_tfc\_workspace\_id) | n/a |
| <a name="output_tfc_workspace_name"></a> [tfc\_workspace\_name](#output\_tfc\_workspace\_name) | n/a |

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

module "test" {
  source = "github.com/fabiendelpierre/terraform-github-tfc-workspace-module"

  github_repo_name        = "foo"
  github_repo_description = "..."

  github_repo_use_template        = true
  github_repo_template_owner_name = "owner-org"
  github_repo_template_repo_name  = "template-repo-name"

  tfc_workspace_name    = "foo"
  tfc_organization_name = "tfc-org-name"

  tfc_workspace_terraform_version = "1.0.7"
}
```