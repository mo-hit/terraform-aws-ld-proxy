#------------------------------------------------------------------------------
# SonarQube ALB DNS
#------------------------------------------------------------------------------
output "ld_relay_lb_id" {
  description = "SonarQube Load Balancer ID"
  value       = module.ecs_fargate.aws_lb_lb_id
}

output "ld_relay_lb_arn" {
  description = "SonarQube Load Balancer ARN"
  value       = module.ecs_fargate.aws_lb_lb_arn
}

output "ld_relay_lb_arn_suffix" {
  description = "SonarQube Load Balancer ARN Suffix"
  value       = module.ecs_fargate.aws_lb_lb_arn_suffix
}

output "ld_relay_lb_dns_name" {
  description = "SonarQube Load Balancer DNS Name"
  value       = module.ecs_fargate.aws_lb_lb_dns_name
}

output "ld_relay_lb_zone_id" {
  description = "SonarQube Load Balancer Zone ID"
  value       = module.ecs_fargate.aws_lb_lb_zone_id
}

