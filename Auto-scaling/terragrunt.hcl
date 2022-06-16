terraform {
  source = "..//TF-module/Auto-scaling"
}

inputs = {
  aws_account_id = "Account_ID"
  environment    = ""

  min_size         = 2
  max_size         = 2
  desired_capacity = 2

  # VPC
  vpc_id                      = "VPC_ID"
  key_name                    = ""
  subnets                     = ["SUBNETS"]
}


include {
  path = find_in_parent_folders()
}