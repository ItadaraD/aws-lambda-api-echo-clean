resource "aws_cloudwatch_log_group" "lambda_echo" {
  name              = "/aws/lambda/${var.lambda_name}"
  retention_in_days = 7
}
