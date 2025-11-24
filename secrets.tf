resource "aws_secretsmanager_secret" "app_config" {
  name        = "${var.project_name}/${var.environment}/app-config"
  description = "Application configuration for ${var.project_name} in ${var.environment}"

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "app_config_version" {
  secret_id = aws_secretsmanager_secret.app_config.id
  secret_string = jsonencode({
    apiKey = "demo-api-key-123"
    tier   = var.environment
  })
}
