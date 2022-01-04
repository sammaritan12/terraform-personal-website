locals {
  domain_name = "markpatricio.com"
}

module "personal_website" {
  source      = "./modules/static_website"
  bucket_name = "markpatricio-personal-web-statics"
  domain_name = local.domain_name

  providers = {
    aws.us = aws.us
  }
}
