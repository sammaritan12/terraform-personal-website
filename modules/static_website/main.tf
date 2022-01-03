resource "aws_s3_bucket" "web_statics" {
  bucket = var.bucket_name

  acl = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.web_statics.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket_policy" "web_statics" {
  bucket = aws_s3_bucket.web_statics.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

resource "aws_cloudfront_distribution" "distribution" {
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  origin {
    origin_id   = "origin-bucket-${aws_s3_bucket.web_statics.id}"
    domain_name = aws_s3_bucket.web_statics.website_endpoint

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = "origin-bucket-${aws_s3_bucket.web_statics.id}"
    min_ttl          = "0"
    default_ttl      = "300"
    max_ttl          = "1200"

    viewer_protocol_policy = "redirect-to-https"
    compress               = true

    forwarded_values {
      query_string = false
      headers = [
        "Origin",
        "Access-Control-Request-Headers",
        "Access-Control-Request-Method",
      ]
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  aliases = [var.domain_name, "www.${var.domain_name}"]

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.static_website_acm_cert.arn
    ssl_support_method  = "sni-only"
  }

  custom_error_response {
    error_code         = 404
    response_page_path = "/index.html"
    response_code      = 200
  }

}

resource "aws_acm_certificate" "static_website_acm_cert" {
  provider                  = aws.us
  domain_name               = var.domain_name
  subject_alternative_names = ["*.${var.domain_name}"]
  validation_method         = "DNS"
}