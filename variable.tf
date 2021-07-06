variable "lb_sg_name" {
  type = string
}

variable "instance_sg_name" {
  type = string
}

variable "ins_count" {
  type    = number
  default = 1
}

variable "ingress_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ins_subnet_id" {
  type = string
}

variable "lb_name" {
  type = string
}

variable "internal_lb" {
  type    = bool
  default = false
}

variable "lb_type" {
  type    = string
  default = "application"
}

variable "lb_subnet_mapping_1" {
  type = string
}

variable "lb_subnet_mapping_2" {
  type = string
}

variable "tg_name" {
  type = string
}

variable "tg_vpc_id" {
  type = string
}

variable "tg_att_count" {
  type    = number
  default = 1
}