# variables.tf

variable "traefik_http_port" {
  type        = number
  description = "Puerto externo para HTTP"
  default     = 80
}

variable "traefik_https_port" {
  type        = number
  description = "Puerto externo para HTTPS"
  default     = 443
}

variable "web_network" {
  description = "web_network"
  type = string
}

variable "traefik_network" {
  description = "traefik_network"
  type = string
}