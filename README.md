## AWS ALB Terraform module
#### Terraform module which creates ALB with Target Group resources on AWS.

##### Usage

```
module "alb" {
  source  = "josephphyo/alb/aws"
  
  instance_sg_name = "regional-ec2-sg"
  instance_sg_vpc_id = "vpc-abcd5678"
  ins_subnet_id = "subnet-abcd5678"
  lb_name = "regional-frontend-lb"
  lb_sg_name = "regional-lb-sg"
  lb_sg_vpc_id = "vpc-abcd5678"
  lb_subnet_mapping_1 = "subnet-abcd5678"
  lb_subnet_mapping_2 = "subnet-abcd5678"
  tg_name = "regional-alb-tg"
  tg_vpc_id = "vpc-abcd5678"
}

```

##### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> v1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.48.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.regional_webserver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_lb.regional_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.front_end](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.regional_lb_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.regional_lb_tg_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_security_group.regional_instance_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.regional_lb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ingress_cidr"></a> [ingress\_cidr](#input\_ingress\_cidr) | n/a | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_ins_count"></a> [ins\_count](#input\_ins\_count) | n/a | `number` | `1` | no |
| <a name="input_ins_subnet_id"></a> [ins\_subnet\_id](#input\_ins\_subnet\_id) | n/a | `string` | n/a | yes |
| <a name="input_instance_sg_name"></a> [instance\_sg\_name](#input\_instance\_sg\_name) | n/a | `string` | n/a | yes |
| <a name="input_instance_sg_vpc_id"></a> [instance\_sg\_vpc\_id](#input\_instance\_sg\_vpc\_id) | n/a | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `"t3.micro"` | no |
| <a name="input_internal_lb"></a> [internal\_lb](#input\_internal\_lb) | n/a | `bool` | `false` | no |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | n/a | `string` | n/a | yes |
| <a name="input_lb_sg_name"></a> [lb\_sg\_name](#input\_lb\_sg\_name) | n/a | `string` | n/a | yes |
| <a name="input_lb_sg_vpc_id"></a> [lb\_sg\_vpc\_id](#input\_lb\_sg\_vpc\_id) | n/a | `string` | n/a | yes |
| <a name="input_lb_subnet_mapping_1"></a> [lb\_subnet\_mapping\_1](#input\_lb\_subnet\_mapping\_1) | n/a | `string` | n/a | yes |
| <a name="input_lb_subnet_mapping_2"></a> [lb\_subnet\_mapping\_2](#input\_lb\_subnet\_mapping\_2) | n/a | `string` | n/a | yes |
| <a name="input_lb_type"></a> [lb\_type](#input\_lb\_type) | n/a | `string` | `"application"` | no |
| <a name="input_tg_att_count"></a> [tg\_att\_count](#input\_tg\_att\_count) | n/a | `number` | `1` | no |
| <a name="input_tg_name"></a> [tg\_name](#input\_tg\_name) | n/a | `string` | n/a | yes |
| <a name="input_tg_vpc_id"></a> [tg\_vpc\_id](#input\_tg\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_regional_alb_dns"></a> [regional\_alb\_dns](#output\_regional\_alb\_dns) | Regional Application Load Balancer DNS |
