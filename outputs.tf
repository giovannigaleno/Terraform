output "nginx_ip" {
  description = "IP del contenedor de Nginx"
  value       = module.nginx.container_ip
}

output "nodejs_ip" {
  description = "IP del contenedor de Node.js"
  value       = module.nodejs.container_ip
}

output "mysql_ip" {
  description = "IP del contenedor de MySQL"
  value       = module.mysql.container_ip
}

output "redis_ip" {
  description = "IP del contenedor de Redis"
  value       = module.redis.container_ip
}

output "traefik_ip" {
  description = "IP del contenedor de Traefik"
  value       = module.traefik.traefik_ip
}


output "traefik_port" {
  description = "IP del contenedor de Traefik"
  value       = module.traefik.traefik_port
}
