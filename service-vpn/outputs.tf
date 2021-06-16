output "vpn_info" {
  value = {
    dns_name = aws_ec2_client_vpn_endpoint.vpn.dns_name
    id       = aws_ec2_client_vpn_endpoint.vpn.id
    s3bucket = aws_s3_bucket.vpn.id
  }
}
