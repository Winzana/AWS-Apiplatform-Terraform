terraform {
  backend "s3" {
  }
}

data "terraform_remote_state" "base_remote_state" {
  backend = "s3"
  config = {
    bucket    = "apiplatform-terraform-backend"
    key       = "env:/dev/terraform-apiplatform/base-infra.tfstate"
    region    = "eu-west-1"
    profile   = "apiplatform"
  }
}
