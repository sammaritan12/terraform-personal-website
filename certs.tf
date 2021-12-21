resource "aws_acm_certificate" "wildcard" {
  domain_name               = "markpatricio.com"
  subject_alternative_names = ["*.markpatricio.com"]

  validation_method = "DNS"
}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.wildcard.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}