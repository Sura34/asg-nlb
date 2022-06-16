terraform {
  source = "..//TF-module/Auto-scaling"
}

inputs = {
  aws_account_id = "Account_ID"
  environment    = ""

  # VPC
  vpc_id                      = ""
  key_name                    = ""
  subnets                     = ""
}
