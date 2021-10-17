output "regional_alb_dns" {
  value       = aws_lb.regional_lb.dns_name
  description = "Regional Application Load Balancer DNS"
}