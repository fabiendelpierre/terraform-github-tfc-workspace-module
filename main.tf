resource "github_repository" "blank" {
  count = (var.github_repo_use_template == true ? 0 : 1)

  name        = var.github_repo_name
  description = var.github_repo_description
  visibility  = var.github_repo_visibility

  has_issues   = var.github_repo_enable_issues
  has_projects = var.github_repo_enable_projects
  has_wiki     = var.github_repo_enable_wiki

  gitignore_template = var.github_repo_gitignore_template
  license_template   = var.github_repo_license_template
}

resource "github_repository" "templated" {
  count = (var.github_repo_use_template == true ? 1 : 0)

  name        = var.github_repo_name
  description = var.github_repo_description
  visibility  = var.github_repo_visibility

  template {
    owner      = var.github_repo_template_owner_name
    repository = var.github_repo_template_repo_name
  }
}

resource "github_repository_file" "blank_providers_tf" {
  count = (var.github_repo_use_template == true ? 0 : 1)

  repository = github_repository.blank[0].name
  branch     = github_repository.blank[0].default_branch
  file       = "providers.tf"

  commit_message = "Create providers.tf with names of TFC org and workspace"
  commit_author  = "Terraform Cloud"
  commit_email   = "fabiend@app.terraform.io"

  overwrite_on_create = true

  content = templatefile("${path.module}/providers.tf.tpl", {
    tfe_organization_name = var.tfc_organization_name
    tfe_workspace_name    = var.tfc_workspace_name
  })

  lifecycle {
    ignore_changes = [content]
  }
}

resource "github_repository_file" "templated_providers_tf" {
  count = (var.github_repo_use_template == true ? 1 : 0)

  repository = github_repository.templated[0].name
  branch     = github_repository.templated[0].default_branch
  file       = "providers.tf"

  commit_message = "Update providers.tf with names of TFC org and workspace"
  commit_author  = "Terraform Cloud"
  commit_email   = "fabiend@app.terraform.io"

  overwrite_on_create = true

  content = templatefile("${path.module}/providers.tf.tpl", {
    tfe_organization_name = var.tfc_organization_name
    tfe_workspace_name    = var.tfc_workspace_name
  })

  lifecycle {
    ignore_changes = [content]
  }
}

resource "tfe_workspace" "main" {
  name              = var.tfc_workspace_name
  organization      = var.tfc_organization_name
  terraform_version = var.tfc_workspace_terraform_version
}