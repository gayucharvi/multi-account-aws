

resource "aws_organizations_account" "dev" {
  name = var.account_name
  email = var.email_address
  role_name = "owner"
  lifecycle {
    prevent_destroy = true
  }
}

output "aws_account_ids" {
  value = {
    dev = aws_organizations_account.dev.id
  }
}
