#-------------------------------------------------------------
### Getting aws_caller_identity
#-------------------------------------------------------------
data "aws_caller_identity" "current" {
}

#-------------------------------------------------------------
## Getting the rds db password
#-------------------------------------------------------------
data "aws_ssm_parameter" "identity_provider" {
  name = local.identity_provider_ssm
}

#-------------------------------------------------------------
### Getting the bastion vpc
#-------------------------------------------------------------
data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = var.remote_state_bucket_name
    key    = "bastion-vpc/terraform.tfstate"
    region = var.region
  }
}

#-------------------------------------------------------------
### Getting the vpn vpc
#-------------------------------------------------------------
data "terraform_remote_state" "vpn_vpc" {
  backend = "s3"

  config = {
    bucket = var.remote_state_bucket_name
    key    = "vpn-vpc/terraform.tfstate"
    region = var.region
  }
}
