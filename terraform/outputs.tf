output "api_invoke_url" {
  description = "Base URL da HTTP API (stage $default)"
  value       = aws_apigatewayv2_stage.default.invoke_url
}
