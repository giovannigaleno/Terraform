# variables.tf

variable "redis_port" {
  type        = number
  description = "Puerto externo para el contenedor Redis"
  default     = 6379
}
