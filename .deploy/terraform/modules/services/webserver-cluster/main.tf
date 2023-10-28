locals {
  http_port    = 80
  https_port   = 443
  any_port     = 0
  tcp_protocol = "tcp"
  any_protocol = -1
  all_ips      = ["0.0.0.0/0"]
}

resource "aws_security_group" "alb" {
  name   = "${var.cluster_name}-alb"
  vpc_id = aws_vpc.vpc.id
}

resource "aws_security_group_rule" "alb_http_ingress" {
  type              = "ingress"
  from_port         = local.http_port
  to_port           = local.http_port
  protocol          = local.tcp_protocol
  cidr_blocks       = local.all_ips
  security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "alb_https_ingress" {
  type              = "ingress"
  from_port         = local.https_port
  to_port           = local.https_port
  protocol          = local.tcp_protocol
  cidr_blocks       = local.all_ips
  security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "alb_any_ingress" {
  type              = "ingress"
  from_port         = local.any_port
  to_port           = local.any_port
  protocol          = local.any_protocol
  cidr_blocks       = local.all_ips
  security_group_id = aws_security_group.alb.id
}

data "aws_subnets" "public" {
  tags = {
    Tier = "public"
  }
  depends_on = [
    aws_subnet.subnet_1,
    aws_subnet.subnet_2,
    aws_subnet.subnet_3
  ]
}

resource "aws_alb" "alb" {
  name               = "${var.cluster_name}-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = data.aws_subnets.public.ids
  access_logs {
    bucket  = "fss-service-files"
    prefix  = "alb"
    enabled = true
  }
}


