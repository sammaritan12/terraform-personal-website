output "bucket_id" {
  description = "ID of bucket created"
  value       = aws_s3_bucket.web_statics.id
}

output "cloudfront_domain_name" {
  description = "The domain name of the cloudfront distribution"
  value       = aws_cloudfront_distribution.distribution.domain_name
}

output "cloudfront_hosted_zone_id" {
  description = "The hosted zone id of the cloudfront distribution"
  value       = aws_cloudfront_distribution.distribution.hosted_zone_id
}