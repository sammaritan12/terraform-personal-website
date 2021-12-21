terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 3.1, != 3.14.0"
      configuration_aliases = [aws.us]
    }
  }
}