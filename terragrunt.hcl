# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

# When using this terragrunt config, terragrunt will generate the file "provider.tf" with the aws provider block before
# calling to terraform. Note that this will overwrite the `provider.tf` file if it already exists.
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "REGION_NAME"
  profile = "PROFILE"
}
EOF
}

# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "s3"

  config = {
    region         = local.aws_region
    profile        = local.aws_profile
    encrypt        = true
    bucket         = "${name}-terraform-states"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = "terraform-locks"

    s3_bucket_tags = {
      name = "Terraform state storage"
    }

    dynamodb_table_tags = {
      name = "Terraform lock table"
    }
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

