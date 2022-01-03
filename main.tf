module "personal_website" {
  source          = "./modules/static_website"
  bucket_name     = "markpatricio-personal-web-statics"
  domain_name     = local.domain_name
  route53_zone_id = aws_route53_zone.markpatricio_public.zone_id

  providers = {
    aws.us = aws.us
  }
}

module "ses-lambda-forwarder" {
  source  = "cloudposse/ses-lambda-forwarder/aws"
  version = "0.11.0"

  namespace = "mp"
  stage     = "prod"
  name      = "app"
  # delimiter  = "-"
  # attributes = []
  # tags       = {}

  region = "ap-southeast-2"
  domain = "markpatricio.com"

  relay_email = "mark@markpatricio.com"
  forward_emails = {
    "mark@markpatricio.com" = ["sammaritan12@gmail.com"]
  }
}

