# variables.tf

variable "mysql_port" {
  type        = number
  description = "Puerto externo para el contenedor MySQL"
}

variable "mysql_root_password" {
  type        = string
  description = "Contraseña del usuario root de MySQL"
  sensitive   = true
}

variable "mysql_database" {
  type        = string
  description = "Nombre de la base de datos predeterminada a crear en MySQL"
}

variable "mysql_user" {
  type        = string
  description = "Usuario para la base de datos MySQL"
}

variable "mysql_password" {
  type        = string
  description = "Contraseña del usuario para la base de datos MySQL"
  sensitive   = true
}
