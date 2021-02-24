

#------------------------------------------------------------------------------
# AWS Cloudwatch Logs
#------------------------------------------------------------------------------
module aws_cw_logs {
  source  = "cn-terraform/cloudwatch-logs/aws"
  version = "1.0.7"
  # source  = "../terraform-aws-cloudwatch-logs"

  logs_path = "/ecs/service/${var.name_prefix}-sonar"
}

#------------------------------------------------------------------------------
# ECS Fargate Service
#------------------------------------------------------------------------------
module "ecs_fargate" {
  source  = "cn-terraform/ecs-fargate/aws"
  version = "2.0.22"
  # source = "../terraform-aws-ecs-fargate"

  name_prefix                  = "${var.name_prefix}-ld-proxy"
  vpc_id                       = var.vpc_id
  public_subnets_ids           = var.public_subnets_ids
  private_subnets_ids          = var.private_subnets_ids
  container_name               = "${var.name_prefix}-ld-proxy"
  container_image              = "launchdarkly/ld-relay:v6"
  container_cpu                = 1024
  container_memory             = 8192
  container_memory_reservation = 4096
  lb_http_ports = {
    default = {
      listener_port     = 80
      target_group_port = 8030
    }
  }
  lb_https_ports = {}
  command = [
    "--from-env"
  ]
  ulimits = [
    {
      "name" : "nofile",
      "softLimit" : 65535,
      "hardLimit" : 65535
    }
  ]
  port_mappings = [
    {
      containerPort = 8030
      hostPort      = 8030
      protocol      = "tcp"
    }
  ]
  environment = [
    {
      name="LD_ENV_production"
      value=var.production_key
    },
    {
      name="LD_ENV_staging"
      value=var.staging_key
    },
    {
      name="LD_ENV_development"
      value=var.dev_key
    },
  ]
  log_configuration = {
    logDriver = "awslogs"
    options = {
      "awslogs-region"        = var.region
      "awslogs-group"         = "/ecs/service/${var.name_prefix}-ld-proxy"
      "awslogs-stream-prefix" = "ecs"
    }
    secretOptions = null
  }
}
