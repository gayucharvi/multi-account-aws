resource "aws_iam_role" "terraform" {
  name  = "terraform"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": { "AWS": "${var.terraform_user_arn}" },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# N.B. This allows the terraform role to do a lot of dangerous stuff, review this before you go to production
resource "aws_iam_role_policy_attachment" "terraform_administrator_access" {
  role       = aws_iam_role.terraform.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
