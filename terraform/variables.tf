variable "aws_region" {
  description = "AWS Region for S3 and other resources."
  default = "eu-north-1"
}

variable "aws_region_cf" {
  description = "AWS Region for CloudFront (ACM certs only supports us-east-1)."
  default = "us-east-1"
}

variable "fqdn" {
  description = "The fully-qualified domain name of the resulting S3 website."
  default     = "www.nkvl.fi"
}

variable "domain" {
  description = "The domain name / ."
  default     = "nkvl.fi." 
}

variable "allowed_ips" {
  type    = list
  # invalid IP, completely inaccessible
  default = ["999.999.999.999/32"]
}