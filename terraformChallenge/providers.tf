terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"

    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.1"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = var.region
  profile = "AdministratorAccess-296062556421"
}

provider "random" {
  # Configuration options
}

# To use this profile, specify the profile name using --profile, as shown:
# aws sts get-caller-identity --profile AdministratorAccess-296062556421
# https://rocketseat-sso-iac2.awsapps.com/start https://rocketseat-sso-iac2.awsapps.com/start
