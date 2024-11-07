# outputs.tf

output "container_ip" {
  description = "La IP del contenedor de Nginx"
  value       = docker_container.nginx.network_data[0].ip_address
}

output "container_port" {
  description = "Puerto de Nginx expuesto al host"
  value       = var.nginx_port
}
