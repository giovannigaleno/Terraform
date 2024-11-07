# variables.tf

variable "nginx_port" {
  type        = number
  description = "Puerto externo en el que el contenedor de Nginx estará expuesto"
}
