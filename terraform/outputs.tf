output "instance_id" {
  value = aws_instance.app_server.id
}

output "sns_topic_arn" {
  value = aws_sns_topic.alerts.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.restart_instance.function_name
}
