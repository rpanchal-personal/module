provider "aws" {
  region = "us-east-1"
  profile = "default"
}


module "ec2_module" {
    source = "./ecw_module"
}