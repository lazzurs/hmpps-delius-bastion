resource "aws_iam_saml_provider" "iam" {
  count                  = data.aws_ssm_parameter.identity_provider.value != null ? 1 : 0
  name                   = local.common_name
  saml_metadata_document = data.aws_ssm_parameter.identity_provider.value
}
