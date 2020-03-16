resource "aws_route53_zone" "main" {
  provider     = aws.main
  name         = var.domain
}

resource "aws_route53_record" "www" {
  provider        = aws.main
  zone_id         = aws_route53_zone.main.zone_id
  name            = var.fqdn
  ttl             = "300"
  type            = "NS"
  
  records = [
    "${aws_route53_zone.main.name_servers.0}",
    "${aws_route53_zone.main.name_servers.1}",
    "${aws_route53_zone.main.name_servers.2}",
    "${aws_route53_zone.main.name_servers.3}",
  ]
  #alias {
  #  name    = aws_cloudfront_distribution.cdn.domain_name
  #  zone_id = aws_cloudfront_distribution.cdn.hosted_zone_id
  #  evaluate_target_health = false
  #}
}