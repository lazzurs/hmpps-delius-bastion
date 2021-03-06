####################################################
# DATA SOURCE MODULES FROM OTHER TERRAFORM BACKENDS
####################################################
data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = var.remote_state_bucket_name
    key    = "bastion-vpc/terraform.tfstate"
    region = var.region
  }
}

# ## ROUTES to NATGATEWAY

resource "aws_route" "route-privatesubnet-az1-to-natgateway-az1" {
  route_table_id         = data.terraform_remote_state.vpc.outputs.private-routetable-az1
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = data.terraform_remote_state.vpc.outputs.natgateway.az1
}

resource "aws_route" "route-privatesubnet-az2-to-natgateway-az2" {
  route_table_id         = data.terraform_remote_state.vpc.outputs.private-routetable-az2
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = data.terraform_remote_state.vpc.outputs.natgateway.az2
}

resource "aws_route" "route-privatesubnet-az3-to-natgateway-az3" {
  route_table_id         = data.terraform_remote_state.vpc.outputs.private-routetable-az3
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = data.terraform_remote_state.vpc.outputs.natgateway.az3
}

