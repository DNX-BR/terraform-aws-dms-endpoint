output "arn" {
  value       = try(aws_dms_endpoint.default.endpoint_arn, "")
  description = "Amazon Resource Name (ARN) of the DMS Endpoint"
}
