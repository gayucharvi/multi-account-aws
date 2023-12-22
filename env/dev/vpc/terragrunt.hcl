include {
  path = find_in_parent_folders()
}

include "common" {
  path   = "${dirname(find_in_parent_folders())}/common/vpc.hcl"
  expose = true
}

locals {
  vpc_cidr = var.vpc_cidr
  vpc_name = "myvpc"
}

inputs = {
  vpc_cidr = local.vpc_cidr
  vpc_name = local.vpc_name
}
