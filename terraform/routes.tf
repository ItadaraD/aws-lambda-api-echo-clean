resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id                  = aws_apigatewayv2_api.http_api.id
  integration_type        = "AWS_PROXY"
  integration_uri         = aws_lambda_function.echo.invoke_arn
  integration_method      = "POST"
  payload_format_version  = "2.0"
}

# Rotas explícitas
resource "aws_apigatewayv2_route" "health" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "GET /health"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

resource "aws_apigatewayv2_route" "echo" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "GET /echo"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

# Catch-all (resolve / e qualquer rota inválida)
resource "aws_apigatewayv2_route" "proxy" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "ANY /{proxy+}"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}
