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
| terraform | >= 0.13.0 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| certificate\_arn | The Amazon Resource Name (ARN) for the certificate | `string` | `""` | no |
| database\_name | The name of the endpoint database | `string` | n/a | yes |
| endpoint\_id | The database endpoint identifier | `string` | n/a | yes |
| endpoint\_type | Endpoint type: `source` or `target` | `string` | n/a | yes |
| engine\_name | The type of engine for the endpoint. Can be one of aurora \| aurora-postgresql\| azuredb \| db2 \| docdb \| dynamodb \| elasticsearch \| kafka \| kinesis \| mariadb \| mongodb \| mysql \| oracle \| postgres \| redshift \| s3 \| sqlserver \| sybase | `string` | n/a | yes |
| environment\_name | Environment name to use as a prefix to this Endpoint | `string` | n/a | yes |
| extra\_connection\_attributes | Additional attributes associated with the connection | `string` | `""` | no |
| kms\_key\_arn | KMS Key ARN to use a CMK instead of default shared key, when storage\_encrypted is true | `string` | `""` | no |
| password | The password to be used to login to the endpoint database | `string` | `""` | no |
| port | The port used by the endpoint database | `number` | n/a | yes |
| rds\_identifier | The RDS Identifier at AWS | `string` | n/a | yes |
| server\_name | The host name of the server | `string` | n/a | yes |
| ssl\_mode | The SSL mode to use for the connection. Can be one of none \| require \| verify-ca \| verify-full | `string` | `"none"` | no |
| username | The user name to be used to login to the endpoint database | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Amazon Resource Name (ARN) of the DMS Endpoint |

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-template/blob/master/LICENSE) for full details.