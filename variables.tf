variable "vpc_cidr" {
  description = "VPC CIDR BLOCK"
  default = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
  description = "PRIVATE SUBNET CIDR"
  default = "10.0.1.0/24"
}

variable "public_subnet_cidr" {
  description = "PUBLIC SUBNET CIDR"
  default = "10.0.0.0/24"
}

variable "region_location" {
  description = "selected region"
 }

variable "aws_root_account_id" {
  default = "xx"
}

variable "terraform_user_arn" {
  default = "xx"
}

variable "username" {
  default = "terraform-uat"
}

variable "account_name" {
  default = "dev"
}

variable "email_address" {
  default = "dev@example99999.com"
}




