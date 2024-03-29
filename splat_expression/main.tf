provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "users" {
  name  = "iamuser_${count.index}"
  count = 3
  path  = "/system/"
}

output "arns" {
  value = aws_iam_user.users[*].arn
}
