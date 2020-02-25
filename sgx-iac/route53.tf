resource "aws_route53_record" "webgoat" {
  depends_on = ["null_resource.ansible"]
  zone_id = "Z2JR0FEN9RROGY"
  name    = "webgoat.nttdemo.net"
  type    = "A"
  ttl     = "300"
  records = ["aws_instance.web.public_ip"]
}
