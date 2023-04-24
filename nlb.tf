# provider "aws" {
#   region = "ap-south-1"
# }

resource "aws_lb_target_group" "test_tg_group" {
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
  name        = "my-test"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = "${aws_vpc.dev.id}"
}

# resource "aws_vpc" "dev1" {
#   cidr_block           = var.cidr_block
#   enable_dns_hostnames = true
#   enable_dns_support   = true
#   tags = {
#     Name = "dev-VPC"
#   }
# }

