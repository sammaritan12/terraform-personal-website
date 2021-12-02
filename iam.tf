data "aws_iam_user" "terraform" {
  user_name = "terraform"
}

module "circleci_iam_user" {
  source         = "./modules/circleci_iam_user"
  s3_bucket_name = aws_s3_bucket.web_statics.id
}