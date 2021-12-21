output "bucket_id" {
  description = "ID of bucket created"
  value       = aws_s3_bucket.web_statics.id
}