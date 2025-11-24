data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda_function.py"
  output_path = "${path.module}/lambda_function.zip"
}

resource "aws_lambda_function" "api_handler" {
  function_name = "${var.project_name}-${var.environment}-handler"

  runtime = "python3.11"
  handler = "lambda_function.handler"

  role = aws_iam_role.lambda_execution.arn

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  environment {
    variables = {
      TABLE_NAME  = aws_dynamodb_table.items.name
      SECRET_NAME = aws_secretsmanager_secret.app_config.name
    }
  }


  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}
