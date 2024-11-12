# variables.tf

variable "nginx_port" {
  type        = number
  description = "Puerto externo en el que el contenedor de Nginx estará expuesto"
}

variable "network_name" {
  description = "web_network"
  type = string
}