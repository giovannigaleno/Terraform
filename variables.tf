# variables.tf

variable "nginx_port" {
  type    = number
  default = 80
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

variable "redis_password" {                  # # # # # # #
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

variable "traefik_http_port" {
  type    = number
  default = 80
}


variable "traefik_https_port" {
  type    = number
  default = 443
}