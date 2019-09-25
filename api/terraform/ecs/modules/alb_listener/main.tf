# Route 53 DNS record for the application load balancer
resource "aws_route53_record" "alb_record_api" {
    zone_id = var.route53_zone_id
    name = terraform.workspace
    type = "A"

    alias {
        name = var.alb_dns_name
        zone_id = var.alb_zone_id
        evaluate_target_health = false
    }
}

resource "aws_alb_target_group" "apiplatform_service_tg" {
    name = "${replace(terraform.workspace, "/(.{0,15})(.*)/", "$1")}-${var.service_name}-tg"

    protocol = "HTTP"
    port = var.container_port
    vpc_id = var.vpc_id

    health_check {
        matcher = 200
        path = "/healthy"
        interval = 12
        healthy_threshold = 3
        unhealthy_threshold = 6
    }

    target_type = "ip"
}

resource "aws_alb_listener" "instance_listener_http" {
    load_balancer_arn = var.instance_alb_arn
    port = 80
    protocol = "HTTP"

    default_action {
        target_group_arn = aws_alb_target_group.apiplatform_service_tg.id
        type = "forward"
    }

    depends_on = [
        aws_alb_target_group.apiplatform_service_tg
    ]
}

resource "aws_alb_listener_rule" "apiplatform_service_listener" {
    listener_arn = aws_alb_listener.instance_listener_http.arn

    action {
        type = "forward"
        target_group_arn = aws_alb_target_group.apiplatform_service_tg.arn
    }

    condition {
        field = "host-header"
        values = [
            "${terraform.workspace}.dev.${var.base_url}"]
    }

    depends_on = [
        aws_alb_listener.instance_listener_http
    ]
}
