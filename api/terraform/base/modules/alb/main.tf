# Application load balancer that distributes load between the instances
resource "aws_alb" "instance_alb" {
  name = "${terraform.workspace}-api"
  internal = false

  security_groups = [
    var.security_group_internal_id,
    var.security_group_inbound_id,
  ]

  subnets = var.alb_subnet_ids
}

resource "aws_route53_zone" "env_zone" {
  name = "${terraform.workspace}.${var.base_url}"
  comment = "Hosted zones for the ${terraform.workspace} environment."
  force_destroy = true

  tags = {
    Name = "${terraform.workspace} zone"
  }
}

data "aws_route53_zone" "main" {
  name = var.base_url
}

# Link zone
resource "aws_route53_record" "link-ns" {
  zone_id = data.aws_route53_zone.main.zone_id
  name = "${terraform.workspace}.${var.base_url}"
  type = "NS"
  ttl = 30

  records = aws_route53_zone.env_zone.name_servers
}

