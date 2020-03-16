resource "aws_s3_bucket" "main" {
  provider = aws.main
  bucket   = var.fqdn
  acl      = "private"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}