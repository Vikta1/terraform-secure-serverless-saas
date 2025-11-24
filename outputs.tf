output "api_invoke_url" {
  description = "Base URL for the HTTP API (GET /items is available)"
  value       = "${aws_apigatewayv2_stage.dev.invoke_url}/items"
}

output "api_url" {
  description = "Invoke URL for the HTTP API"
  value       = "${aws_apigatewayv2_stage.dev.invoke_url}/items"
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  value       = aws_dynamodb_table.items.name
}

output "kms_key_alias" {
  description = "KMS key alias used for DynamoDB encryption"
  value       = aws_kms_alias.dynamodb.name
}

output "secret_name" {
  description = "Name of the secret stored in Secrets Manager"
  value       = aws_secretsmanager_secret.app_config.name
}

output "lambda_function_name" {
  description = "Lambda function that powers the API"
  value       = aws_lambda_function.api_handler.function_name
}
