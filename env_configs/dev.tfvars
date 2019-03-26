bastion_domain_zone = "bastion-dev.probation.hmpps.dsd.io."

bastion_cidr_block = "10.161.98.0/25"

bastion_public_cidr = {
  az1 = "10.161.98.0/28"

  az2 = "10.161.98.16/28"

  az3 = "10.161.98.32/28"
}

# In the format of peering_id,subnet

## NOTE: Add new items to end of list.
## Items added or removed from middle of list will cause peering connections
## to be destroyed and recreated.

bastion_peering_ids = [
  "pcx-07dac042ba70d7994,10.161.128.0/25,hmpps-vcms-dev",
  "pcx-0ab3ee81af30c8dcb,10.161.128.128/25,hmpps-vcms-test",
  "pcx-0161b3c5419c6ddc1,10.161.64.0/24,hmpps-vcms-perf",
  "pcx-00efa04a17abcff11,10.161.65.0/24,hmpps-vcms-stage",
  "pcx-089ec396b50a4662b,10.161.20.0/22,delius-core-dev",
  "pcx-088f1f4fb40cea44a,10.161.73.0/24,delius-new-tech-dev",
  "pcx-0cc5e82fe8f726785,10.162.0.0/20,delius-test",
  "pcx-020091becf6f4fc01,10.162.16.0/20,delius-perf",
  "pcx-0acaa20bf595e37a0,10.162.32.0/20,delius-stage",
  "pcx-0d129c7968ddb1a26,10.161.4.0/22,delius-core-sandpit",
  "pcx-0e74f31beaf9d280c,10.161.75.0/24,alfresco-dev",
  "pcx-0ecec4aab0056807e,10.161.79.0/24,mis-nart-test",
  "pcx-0a8f180e3124621e9,10.161.80.0/24,alfresco-sbx",
  "pcx-08e9c692686409f51,10.161.96.0/24,eng-dev",
  "pcx-0a556138dad27ad0a,10.162.48.0/20,delius-po-test1",
  "pcx-0763f1658dd75a154,10.162.64.0/20,delius-po-test2",
  "pcx-0ffe096b1766c58f8,10.162.96.0/20,delius-training",
  "pcx-07bba151c11ef9d9f,10.162.80.0/20,delius-training-test",
  "pcx-027c6dc6b5283023e,10.161.74.0/24,delius-new-tech-sbx",
  "pcx-073714a27f3f7d0a4,10.161.99.0/24,mis-nart-dev",
  "pcx-09b584e627db5e332,10.162.112.0/20,delius-mis-test",
]
