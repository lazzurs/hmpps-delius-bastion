resource "aws_security_group" "vpn" {
  name_prefix = local.common_name
  description = "Client VPN network associations"
  tags        = local.tags
  vpc_id      = local.vpc_id

  ingress {
    description = "Allow self access only by default"
    from_port   = 0
    protocol    = -1
    self        = true
    to_port     = 0
  }
}
