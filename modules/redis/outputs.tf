# outputs.tf

output "container_ip" {
  description = "La IP del contenedor Redis"
  value       = docker_container.redis.network_data[0].ip_address
}

output "container_port" {
  description = "Puerto del contenedor Redis expuesto al host"
  value       = var.redis_port
}
