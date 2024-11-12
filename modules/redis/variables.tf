# variables.tf

variable "redis_port" {
  type        = number
  description = "Puerto externo para el contenedor Redis"
  default     = 6379
}


variable "network_name" {
  description = "web_network"
  type = string
}