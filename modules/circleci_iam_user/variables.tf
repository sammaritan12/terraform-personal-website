variable "s3_bucket_name" {
  type        = string
  description = "The S3 bucket name to upload to with the CircleCI IAM User"
}

variable "cloudfront_distribution_arn" {
  type        = string
  description = "ARN of cloudfront distribution, used to allow invalidations"
}