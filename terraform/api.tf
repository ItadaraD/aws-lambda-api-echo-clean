resource "aws_apigatewayv2_api" "http_api" {
  name          = "lambda-echo-api"
  protocol_type = "HTTP"
}
