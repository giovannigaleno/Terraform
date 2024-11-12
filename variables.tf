# variables.tf

variable "nginx_port" {
  type    = number
  default = 8081
}

variable "nodejs_port" {
  type    = number
  default = 3000
}

variable "mysql_port" {
  type    = number
  default = 3306
}

variable "redis_port" {
  type    = number
  default = 6379
}

variable "mysql_root_password" {
  type    = string
  default = "root_password"
}

variable "redis_password" {
  type    = string
  default = "redis_password"
}

variable "mysql_user" {
  type = string
}

variable "mysql_password" {
  type = string
}

variable "mysql_database" {
  type = string
}

# Puertos de Traefik (cambiamos para evitar conflicto con Nginx)

variable "traefik_http_port" {
  type    = number
  default = 8080  # Cambiamos de 80 a 8080
}

variable "traefik_https_port" {
  type    = number
  default = 8443  # Cambiamos de 443 a 8443
}
