variable "bucket_name" {
  type        = string
  description = "Name of bucket to create for the static website"
}

variable "domain_name" {
  type        = string
  description = "Domain name to host static website to"
}

variable "route53_zone_id" {
  type        = string
  description = "The route53 zone id"
}