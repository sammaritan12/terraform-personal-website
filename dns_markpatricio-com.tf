resource "aws_route53_zone" "markpatricio_public" {
  name = local.domain_name
}