module "personal_website" {
  source          = "./modules/static_website"
  bucket_name     = "markpatricio-personal-web-statics"
  domain_name     = local.domain_name
  route53_zone_id = aws_route53_zone.markpatricio_public.zone_id

  providers = {
    aws.us = aws.us
  }
}