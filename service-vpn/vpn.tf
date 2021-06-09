resource "aws_ec2_client_vpn_endpoint" "vpn" {
  description            = "Client VPN"
  client_cidr_block      = var.vpn_configs["client_cidr_block"]
  server_certificate_arn = local.public_ssl_arn
  split_tunnel           = var.split_tunnel_enabled
  tags                   = local.tags

  authentication_options {
    type              = "federated-authentication"
    saml_provider_arn = aws_iam_saml_provider.iam[0].arn
  }

  connection_log_options {
    enabled               = true
    cloudwatch_log_group  = aws_cloudwatch_log_group.vpn.name
    cloudwatch_log_stream = aws_cloudwatch_log_stream.vpn.name
  }
}

resource "aws_ec2_client_vpn_network_association" "vpn" {
  for_each = local.associated_subnets

  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.vpn.id
  subnet_id              = each.value

  security_groups = concat(
    [aws_security_group.vpn.id],
    var.additional_security_groups
  )
}
