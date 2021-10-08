variable "github_repo_name" {
  description = "The name of the GitHub repo"
  type        = string
}

variable "github_repo_description" {
  description = "A description for the GitHub repo"
  type        = string
  default     = ""
}

variable "github_repo_visibility" {
  description = "The GitHub repo's visibility (public, private, or internal)"
  type        = string
  default     = "public"

  validation {
    condition     = contains(["public", "private", "internal"], var.github_repo_visibility)
    error_message = "The variable github_repo_visibility must be set to 'public', 'private', or 'internal'."
  }
}

variable "github_repo_enable_issues" {
  description = "value"
  type        = bool
  default     = true
}

variable "github_repo_enable_projects" {
  description = "value"
  type        = bool
  default     = false
}

variable "github_repo_enable_wiki" {
  description = "value"
  type        = bool
  default     = false
}

variable "github_repo_gitignore_template" {
  description = "A gitignore template to preinstall in the GitHub repo"
  type        = string
  default     = "Terraform"
}

variable "github_repo_license_template" {
  description = "The license to apply to the GitHub repository"
  type        = string
  default     = "unlicense"
}

variable "github_repo_use_template" {
  description = "Use a template to create the GitHub repo"
  type        = bool
  default     = true
}

variable "github_repo_template_owner_name" {
  description = "The owner organization of the template repo to use to create this repo"
  type        = string
  default     = ""
}

variable "github_repo_template_repo_name" {
  description = "The name of the template repo to use to create this repo"
  type        = string
  default     = ""
}

variable "tfc_workspace_name" {
  description = "The name of the workspace in Terraform Cloud"
  type        = string
}

variable "tfc_organization_name" {
  description = "The name of the Terraform Cloud organization to which the workspace belongs"
  type        = string
}

variable "tfc_workspace_terraform_version" {
  description = "The version of Terraform to use during the workspace's runs"
  type        = string
}