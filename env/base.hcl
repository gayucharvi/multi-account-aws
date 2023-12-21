# Load env vars...
locals {
  env_vars = yamldecode(join("\n", [file(find_in_parent_folders("env.yaml")), fileexists("${get_terragrunt_dir()}/../region.yaml") ? file("${get_terragrunt_dir()}/../region.yaml"): ""]))
  aws_root_account_id = "889796695136"
}

# ...and make them available as inputs
inputs = {
  region = try(local.env_vars.region, "eu-west-2") # Default to eu-west-2
  env = local.env_vars.env
  aws_account_id = local.env_vars.aws_account_id
  aws_root_account_id = local.aws_root_account_id
}
