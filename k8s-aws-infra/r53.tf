## Once K8S cluster is created, YAML to create resources is applied, we need to change the entry below to point it to
## the correct ALB NAME
resource "aws_route53_record" "alb_dev" {
  allow_overwrite = true
  name            = "devapi.${var.hosted_zone_name}"
  records         = ["k8s-lbgroup-c34715b03f-1596754075.us-east-1.elb.amazonaws.com"] //TODO: set the alb name here
  ttl             = 60
  type            = "CNAME"
  zone_id         = data.aws_route53_zone.public_hosted_zone.zone_id
}