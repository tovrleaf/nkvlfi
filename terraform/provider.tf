provider "aws" {
  region = var.aws_region
  alias  = "main"
}

provider "aws" {
  region = var.aws_region_cf
  alias  = "cloudfront"
}
