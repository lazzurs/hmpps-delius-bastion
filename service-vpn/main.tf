locals {
  account_id            = data.aws_caller_identity.current.account_id
  lb_account_id         = var.lb_account_id
  region                = var.region
  common_name           = "${var.short_environment_identifier}-vpn"
  tags                  = var.tags
  identity_provider_ssm = var.vpn_configs["identity_provider_ssm"]
  vpc_id                = data.terraform_remote_state.vpn_vpc.outputs.vpc["id"]
  vpn_cidr              = data.terraform_remote_state.vpn_vpc.outputs.vpc["cidr"]
  public_ssl_arn        = data.terraform_remote_state.vpc.outputs.public_acm_info["arn"]
  public_ssl_domain     = data.terraform_remote_state.vpc.outputs.public_acm_info["domain_name"]
  associated_subnets = {
    az1 = data.terraform_remote_state.vpn_vpc.outputs.vpn-private-subnet-az1,
    az2 = data.terraform_remote_state.vpn_vpc.outputs.vpn-private-subnet-az2,
    az3 = data.terraform_remote_state.vpn_vpc.outputs.vpn-private-subnet-az3
  }
}
