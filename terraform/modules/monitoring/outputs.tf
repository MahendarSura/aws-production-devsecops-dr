output "log_group_name" {
  description = "Primary CloudWatch log group"
  value       = aws_cloudwatch_log_group.this.name
}

output "application_log_group_name" {
  description = "Application CloudWatch log group"
  value       = aws_cloudwatch_log_group.application.name
}

output "cpu_alarm_arn" {
  description = "CPU alarm ARN"
  value       = try(aws_cloudwatch_metric_alarm.cpu_high[0].arn, null)
}

output "status_alarm_arn" {
  description = "Status check alarm ARN"
  value       = try(aws_cloudwatch_metric_alarm.status_check[0].arn, null)
}
