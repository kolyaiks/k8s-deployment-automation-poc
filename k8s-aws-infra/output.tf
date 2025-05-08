output "public_subents" {
  value = module.vpc.public_subnets
}

output "acm_cert" {
  value = aws_acm_certificate.alb_cert.arn
}

output "kubernetes_endpoint" {
  value = module.eks.cluster_endpoint
}

output "jenkins_ip" {
  value = aws_instance.jenkins.public_ip
}

output "alb_dev_dns_name" {
  value = aws_route53_record.alb_dev.name
}

