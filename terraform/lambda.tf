resource "aws_lambda_function" "echo" {
  function_name = var.lambda_name
  runtime       = var.runtime
  handler       = "main.handler"

  filename         = "./lambda/function.zip"
  source_code_hash = filebase64sha256("./lambda/function.zip")

  role = aws_iam_role.lambda_role.arn

  publish = true
}
