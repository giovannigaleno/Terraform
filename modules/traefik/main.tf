# main.tf

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.25.0"
    }
  }
}



# Crear la imagen de Docker para Traefik
resource "docker_image" "traefik" {
  name = "traefik:latest"  # Especifica la versión de Node.js que deseas usar
}

resource "docker_network" "traefik_network" {
  name = "traefik_network"
}

resource "docker_container" "traefik" {
  name  = "traefik"
  image = docker_image.traefik.image_id

  ports {
    internal = 80
    external = var.traefik_http_port
  }

  ports {
    internal = 443
    external = var.traefik_https_port
  }

  mounts {
    source      = "/home/giovanni/Documents/Terraform/Practica_3/modules/traefik/traefik.toml"
    target = "/traefik.toml"
    type        = "bind"
  }

  # Usar la red traefik_network
  networks_advanced {
    name = docker_network.traefik_network.name
  }

  # Variables de entorno para Traefik
  env = [
    "TRAEFIK_API_INSECURE = true"
  ]

}