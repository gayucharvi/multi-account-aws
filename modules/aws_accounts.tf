
resource "aws_organizations_account" "dev" {

  name = "dev"
  email = "dev@example99999.com"

  lifecycle {
    prevent_destroy = true
  }
}

output "aws_account_ids" {
  value = {
    #prod = aws_organizations_account.prod.id
    dev = aws_organizations_account.dev.id
  }
}
