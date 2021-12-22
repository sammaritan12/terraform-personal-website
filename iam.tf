data "aws_iam_user" "terraform" {
  user_name = "terraform"
}

module "circleci_iam_user" {
  source                      = "./modules/circleci_iam_user"
  s3_bucket_name              = module.personal_website.bucket_id
  cloudfront_distribution_arn = module.personal_website.cloudfront_distribution_arn
}