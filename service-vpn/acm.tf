resource "aws_acm_certificate" "int-ca" {
  private_key       = data.aws_ssm_parameter.tls_ca_key.value
  certificate_body  = data.aws_ssm_parameter.tls_ca_cert.value
  certificate_chain = data.aws_ssm_parameter.tls_ca_chain.value
  tags = merge(
    local.tags,
    {
      "Name" = "${local.common_name}-int-ca"
    },
  )
}

resource "aws_acm_certificate" "server" {
  private_key       = data.aws_ssm_parameter.server_tls_key.value
  certificate_body  = data.aws_ssm_parameter.server_tls_cert.value
  certificate_chain = data.aws_ssm_parameter.tls_ca_chain.value
  tags = merge(
    local.tags,
    {
      "Name" = "${local.common_name}-server"
    },
  )
}

# resource "aws_acmpca_certificate_authority" "vpn" {
#   certificate_authority_configuration {
#     key_algorithm     = "RSA_4096"
#     signing_algorithm = "SHA512WITHRSA"

#     subject {
#       common_name         = local.common_name
#       country             = "GB"
#       organization        = "MOJ"
#       organizational_unit = "HMPPS"

#     }
#   }
#   tags = merge(
#     local.tags,
#     {
#       "Name" = local.common_name
#     },
#   )
# }
