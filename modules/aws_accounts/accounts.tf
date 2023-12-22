

resource "aws_organizations_account" "dev" {
  name = var.account_name
  email = var.email_address
  role_name = "owner"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_account_alias" "alias" {
  provider      = aws.sub-account
  account_alias = var.account_name
}

output "aws_account_ids" {
  value = {
    dev = aws_organizations_account.dev.id
  }
}
