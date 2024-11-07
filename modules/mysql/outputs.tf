# outputs.tf

output "container_ip" {
  description = "La IP del contenedor MySQL"
  value       = docker_container.mysql.network_data[0].ip_address
}

output "container_port" {
  description = "Puerto del contenedor MySQL expuesto al host"
  value       = var.mysql_port
}

output "mysql_database_name" {
  description = "Nombre de la base de datos en MySQL"
  value       = var.mysql_database
}
