resource "aws_acm_certificate" "wildcard" {
  domain_name               = "markpatricio.com"
  subject_alternative_names = ["*.markpatricio.com"]

  validation_method = "DNS"
}