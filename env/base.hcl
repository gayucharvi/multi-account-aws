# Load env vars...
locals {
  env_vars = yamldecode(join("\n", [file(find_in_parent_folders("env.yaml")) ? file("${get_terragrunt_dir()}/../region.yaml"): ""]))
  aws_root_account_id = "xx"
}

# ...and make them available as inputs
inputs = {
  region = try(local.env_vars.region, "eu-west-2") # Default to eu-west-2
  env = local.env_vars.env
  aws_account_id = local.env_vars.aws_account_id
  aws_root_account_id = local.aws_root_account_id
}


  

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket         = "aws-bucket-s3-terragrunt1"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "dynamo_table_s3"
  }
}
EOF
}
