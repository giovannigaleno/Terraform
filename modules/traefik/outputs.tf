# outputs.tf


output "traefik_ip" {
  value = docker_container.traefik.network_data[0].ip_address  # o el atributo correcto según tu configuración
}

output "traefik_port" {
  value = docker_container.traefik.ports  # o el atributo correcto según tu configuración
}
