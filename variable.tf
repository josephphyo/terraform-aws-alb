variable "region" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "sg_name" {
  type = string
}

variable "ingress_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
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