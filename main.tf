## Application Load Balancer Security Group Resource 

resource "aws_security_group" "regional_lb_sg" {
  name        = var.lb_sg_name
  description = "Allow HTTP inbound traffic"
  vpc_id      = var.lb_sg_vpc_id


  ingress {
    description = "ALLOW HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.lb_sg_name
  }
}

## EC2 Instance Security Group Resource 

resource "aws_security_group" "regional_instance_sg" {
  name        = var.instance_sg_name
  description = "Allow SSH inbound traffic"
  vpc_id      = var.instance_sg_vpc_id


  ingress {
    description = "ALLOW SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.instance_sg_name
  }
}

## EC2 Instance Resource 

resource "aws_instance" "regional_webserver" {
  count                  = var.ins_count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.regional_instance_sg.id]
  subnet_id              = var.ins_subnet_id


  tags = {
    Name = "WEB-SERVER-${count.index}"
  }
}

## Application Load Balancer Resource 

resource "aws_lb" "regional_lb" {
  name               = var.lb_name
  internal           = var.internal_lb
  load_balancer_type = "application"
  security_groups    = [aws_security_group.regional_lb_sg.id]
  subnet_mapping {
    subnet_id = var.lb_subnet_mapping_1
  }

  subnet_mapping {
    subnet_id = var.lb_subnet_mapping_2
  }

  tags = {
    Name = var.lb_name
  }
}

## Target Group Resource (Instance Target Group)

resource "aws_lb_target_group" "regional_lb_tg" {
  name     = var.tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.tg_vpc_id

  health_check {
    enabled             = true
    path                = "/"
    port                = 80
    healthy_threshold   = 6
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 5
    matcher             = "200"
  }
}

## Target Group Attachment Resource (Instance Target Group)

resource "aws_lb_target_group_attachment" "regional_lb_tg_attach" {
  count            = var.tg_att_count
  target_group_arn = aws_lb_target_group.regional_lb_tg.arn
  target_id        = element(split(",", join(",", aws_instance.regional_webserver.*.id)), count.index)
  port             = 80
}

## Applicaion Load Balancer Listener 

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.regional_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.regional_lb_tg.arn
  }
}