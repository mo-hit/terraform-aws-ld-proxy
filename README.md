# Launchdarkly Relay Terraform Module for AWS ECS #

This Terraform module deploys a Launchdarkly Relay proxy community server on AWS. Based on official ld-relay Docker image <https://hub.docker.com/r/launchdarkly/ld-relay>.

## Usage

Check valid versions on:
* Github Releases: <https://github.com/mo-hit/terraform-aws-ld-proxy/releases>

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zones | List of Availability Zones | `list(string)` | n/a | yes |
| name\_prefix | Name prefix for resources on AWS | `string` | n/a | yes |
| private\_subnets\_ids | List of Private Subnets IDs | `list(string)` | n/a | yes |
| public\_subnets\_ids | List of Public Subnets IDs | `list(string)` | n/a | yes |
| region | AWS Region the infrastructure is hosted in | `string` | n/a | yes |
| vpc\_id | ID of the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ld\_relay\_lb\_arn | SonarQube Load Balancer ARN |
| ld\_relay\_lb\_arn\_suffix | SonarQube Load Balancer ARN Suffix |
| ld\_relay\_lb\_dns\_name | SonarQube Load Balancer DNS Name |
| ld\_relay\_lb\_id | SonarQube Load Balancer ID |
| ld\_\_lb\_zone\_id | SonarQube Load Balancer Zone ID |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
