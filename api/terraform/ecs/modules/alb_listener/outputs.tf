output "target_group_arn" {
  value = "${aws_alb_target_group.apiplatform_service_tg.arn}"
}
