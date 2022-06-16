terraform {
  source = "..//TF-module/NLB"
}

dependency "vpc" {
  config_path = "../Auto-scaling"
}

inputs = {
  nsg_id         = dependency.Auto-scaling.outputs.nsg_id
  aws_account_id = "Account_ID"
  environment    = ""

  # VPC
  vpc_id                      = ""
  key_name                    = ""
  subnets                     = ""
}



include {
  path = find_in_parent_folders()
}
