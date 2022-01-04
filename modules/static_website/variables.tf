variable "bucket_name" {
  type        = string
  description = "Name of bucket to create for the static website"
}

variable "domain_name" {
  type        = string
  description = "Domain name to host static website to"
}