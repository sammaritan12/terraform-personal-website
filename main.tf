resource "aws_s3_bucket" "web_statics" {
  bucket = "markpatricio-personal-web-statics"
}

module "circleci_iam_user" {
  source         = "./modules/circleci_iam_user"
  s3_bucket_name = aws_s3_bucket.web_statics.id
}