resource "aws_lambda_permission" "api_gateway" {
  statement_id_prefix = "AllowAPIGateway"

  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.echo.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.http_api.execution_arn}/*/*"
}
