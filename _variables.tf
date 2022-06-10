variable "endpoint_type" {
  description = "Endpoint type: `source` or `target`"
  type        = string
}

variable "engine_name" {
  description = "The type of engine for the endpoint. Can be one of aurora | aurora-postgresql| azuredb | db2 | docdb | dynamodb | elasticsearch | kafka | kinesis | mariadb | mongodb | mysql | oracle | postgres | redshift | s3 | sqlserver | sybase"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS Key ARN to use a CMK instead of default shared key, when storage_encrypted is true"
  type        = string
  default     = ""
}

variable "certificate_arn" {
  description = "The Amazon Resource Name (ARN) for the certificate"
  type        = string
  default     = ""
}

variable "rds_identifier" {
  description = "The RDS Identifier at AWS"
  type        = string
}

variable "server_name" {
  description = "The host name of the server"
  type        = string
}

variable "database_name" {
  description = "The name of the endpoint database"
  type        = string
}

variable "endpoint_id" {
  description = "The database endpoint identifier"
  type        = string
}

variable "username" {
  description = "The user name to be used to login to the endpoint database"
  type        = string
  default     = ""
}

variable "password" {
  description = "The password to be used to login to the endpoint database"
  type        = string
  default     = ""
}

variable "port" {
  description = "The port used by the endpoint database"
  type        = number
}

variable "extra_connection_attributes" {
  description = "Additional attributes associated with the connection"
  type        = string
  default     = ""
}

variable "ssl_mode" {
  description = "The SSL mode to use for the connection. Can be one of none | require | verify-ca | verify-full"
  type        = string
  default     = "none"
}

variable "environment_name" {
  description = "Environment name to use as a prefix to this Endpoint"
  type        = string
}