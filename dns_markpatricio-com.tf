resource "aws_route53_zone" "markpatricio_public" {
  name = "markpatricio.com"
}

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.wildcard.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  type            = each.value.type
  zone_id         = aws_route53_zone.markpatricio_public.id
  records         = [each.value.record]
  ttl             = 60
}