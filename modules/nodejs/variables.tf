
# variables.tf

variable "nodejs_port" {
  type        = number
  description = "Puerto externo en el que el contenedor de Node.js estará expuesto"
}

variable "network_name" {
  description = "web_network"
  type = string
}

variable "db_host" {
  type        = string
  default     = ""
}

variable "db_port" {
  type        = number
  description = "Puerto de la base de datos"
  default     = 3306
}

variable "db_user" {
  type        = string
  description = "Usuario de la base de datos"
}

variable "db_pass" {
  type        = string
  description = "Contraseña del usuario de la base de datos"
}
