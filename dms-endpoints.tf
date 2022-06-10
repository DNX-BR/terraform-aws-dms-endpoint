# Create an endpoint for the database
resource "aws_dms_endpoint" "default" {
  endpoint_type = var.endpoint_type
  engine_name   = var.engine_name
  server_name   = var.server_name
  database_name = var.database_name
  endpoint_id   = var.endpoint_id
  password      = data.aws_ssm_parameter.rds_password.value
  username      = data.aws_ssm_parameter.rds_user.value
  port          = var.port

  kms_key_arn                 = try(var.kms_key_arn, "")
  certificate_arn             = try(var.certificate_arn, "")
  ssl_mode                    = try(var.ssl_mode, "none")
  extra_connection_attributes = try(var.extra_connection_attributes, "")

  tags = {
    "Name"          = var.endpoint_id
    "Endpoint type" = var.endpoint_type
    "Managed by"    = "Terraform"
  }
}
