# terraform-personal-website
Infrastructure repo for the creation of a personal website.

## todo

* Change static website module cloudfront distribution from website endpoint to REST API endpoint, add Lambda@Edge to change requests from /item to /item/index.html
    * https://medium.com/@p_stotz/static-website-hosting-leverage-aws-s3-with-cloudfront-route53-acm-and-lambda-edge-8c781bc3b390
    * https://blog.heyitschris.com/posts/hugo-on-aws-s3-cloudfront-route53/
    * https://sanderknape.com/2020/02/building-a-static-serverless-website-using-s3-cloudfront/
    * Alternatively, add `Referrer` header and restrict bucket to that
    * This makes the website more secure and means no one can access the S3 bucket directly