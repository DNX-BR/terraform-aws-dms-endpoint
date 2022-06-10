# terraform-aws-dms

[![Lint Status](https://github.com/DNXLabs/terraform-aws-rds/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-rds/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-rds)](https://github.com/DNXLabs/terraform-aws-rds/blob/master/LICENSE)

## Usage

```hcl
module "dms_target_endpoint" {
  for_each         = { for replication in local.workspace.dms_replication.replications : replication.database_name => replication if local.enabled }
  source           = "git::https://github.com/DNX-BR/terraform-aws-dms-endpoint?ref=0.0.3"

  endpoint_id      = "dms-target-${each.value.database_name}"
  database_name    = each.value.database_name
  rds_identifier   = each.value.endpoints.rds_identifier
  endpoint_type    = "target"
  engine_name      = try(each.value.endpoints.engine_name, "sqlserver")
  port             = try(each.value.endpoints.port, "1433")
  server_name      = each.value.endpoints.target_host
  environment_name = local.workspace.environment
}
```

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dms_endpoint.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_endpoint) | resource |
| [aws_ssm_parameter.dms_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.rds_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.rds_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | The Amazon Resource Name (ARN) for the certificate | `string` | `""` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The name of the endpoint database | `string` | n/a | yes |
| <a name="input_endpoint_id"></a> [endpoint\_id](#input\_endpoint\_id) | The database endpoint identifier | `string` | n/a | yes |
| <a name="input_endpoint_type"></a> [endpoint\_type](#input\_endpoint\_type) | Endpoint type: `source` or `target` | `string` | n/a | yes |
| <a name="input_engine_name"></a> [engine\_name](#input\_engine\_name) | The type of engine for the endpoint. Can be one of aurora \| aurora-postgresql\| azuredb \| db2 \| docdb \| dynamodb \| elasticsearch \| kafka \| kinesis \| mariadb \| mongodb \| mysql \| oracle \| postgres \| redshift \| s3 \| sqlserver \| sybase | `string` | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | Environment name to use as a prefix to this Endpoint | `string` | n/a | yes |
| <a name="input_extra_connection_attributes"></a> [extra\_connection\_attributes](#input\_extra\_connection\_attributes) | Additional attributes associated with the connection | `string` | `""` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | KMS Key ARN to use a CMK instead of default shared key, when storage\_encrypted is true | `string` | `""` | no |
| <a name="input_password"></a> [password](#input\_password) | The password to be used to login to the endpoint database | `string` | `""` | no |
| <a name="input_port"></a> [port](#input\_port) | The port used by the endpoint database | `number` | n/a | yes |
| <a name="input_rds_identifier"></a> [rds\_identifier](#input\_rds\_identifier) | The RDS Identifier at AWS | `string` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | The host name of the server | `string` | n/a | yes |
| <a name="input_ssl_mode"></a> [ssl\_mode](#input\_ssl\_mode) | The SSL mode to use for the connection. Can be one of none \| require \| verify-ca \| verify-full | `string` | `"none"` | no |
| <a name="input_username"></a> [username](#input\_username) | The user name to be used to login to the endpoint database | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name (ARN) of the DMS Endpoint |


<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-template/blob/master/LICENSE) for full details.