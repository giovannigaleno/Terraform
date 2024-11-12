# main.tf


terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.25.0"
    }
  }
}


resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  name  = "nginx_container"
  image = docker_image.nginx.image_id

  ports {
    internal = 8081
    external = var.nginx_port
  }

  #Se puede montar un volumen para configuraciones personalizadas
  mounts {
    # Aquí se puede mapear un archivo o directorio de configuración en el host
    source      = "/home/giovanni/Documents/Terraform/Practica_3/modules/nginx/nginx.conf" # Ruta local al archivo de configuración
    target = "/etc/nginx/nginx.conf"
    type   = "bind"
  }

  # Configuración de red si se requiere conectar servicios en red compartida
  networks_advanced {
    name = var.network_name
    aliases = ["nginx"]
  }
}
