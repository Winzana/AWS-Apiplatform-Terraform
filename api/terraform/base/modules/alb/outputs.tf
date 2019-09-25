output "alb_arn_suffix" {
  value = aws_alb.instance_alb.arn_suffix
}

output "instance_alb_arn" {
  value = aws_alb.instance_alb.arn
}

output "route53_zone_id" {
  value = aws_route53_zone.env_zone.zone_id
}

output "alb_dns_name" {
  value = aws_alb.instance_alb.dns_name
}

output "alb_zone_id" {
  value = aws_alb.instance_alb.zone_id
}
