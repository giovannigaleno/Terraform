# main.tf

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.25.0"
    }
  }
}

resource "docker_image" "redis" {
  name = "redis:latest" # Utiliza la última versión de Redis o especifica una si prefieres
}

resource "docker_container" "redis" {
  name  = "redis_container"
  image = docker_image.redis.image_id

  ports {
    internal = 6379
    external = var.redis_port
  }

  # Configuración de la red para integrarse con otros servicios
  networks_advanced {
    name    = var.network_name
    aliases = ["redis"]
  }

  # Volumen opcional para persistir datos de Redis
  mounts {
    source      = "/home/giovanni/Documents/Terraform/Practica_3/modules/redis/redis_data"
    target      = "/data"
    type   = "bind"
  }
}
