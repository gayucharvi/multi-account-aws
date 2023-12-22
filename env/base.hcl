# Load env vars...
locals {
  env_vars = yamldecode(file("${find_in_parent_folders("env.yaml")}"))
  aws_region   = local.env_vars["aws_region"]
  account_id   = local.env_vars["account_id"]
  environment  = local.env_vars["environment"]
}
generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_region}"
  allowed_account_ids  = ["${local.account_id}"]
  default_tags {
   tags = {
      environment = "${local.environment}"
      terraform = "true"
   }
  }
}
EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "aws-bucket-s3-terragrunt1"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    encrypt        = true
    dynamodb_table = "dynamo_table_s3"
  }
}
  

