# outputs.tf

output "container_ip" {
  description = "La IP del contenedor de Node.js"
  value       = docker_container.nodejs.network_data[0].ip_address
}

#output "container_port" {
#  description = "Puerto del contenedor de Node.js expuesto al host"
#  value       = var.nodejs_port
#}

output "container_port" {
  description = "Puerto del contenedor de Node.js expuesto al host"
  value       = var.nodejs_port
}
