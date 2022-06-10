data "aws_ssm_parameter" "rds_password" {
  name = "/rds/${var.rds_identifier}/PASSWORD"
}

data "aws_ssm_parameter" "rds_user" {
  name = "/rds/${var.rds_identifier}/USER"
}
