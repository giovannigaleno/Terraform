# main.tf


terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.25.0"
    }
  }
}

resource "docker_image" "mysql" {
  name = "mysql:latest" # Puedes especificar la versión de MySQL que prefieras
}

resource "docker_container" "mysql" {
  name  = "mysql_container"
  image = docker_image.mysql.image_id

  ports {
    internal = 3306
    external = var.mysql_port
  }

  # Definir las variables de entorno para configurar MySQL
  env = [
  "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}",
  "MYSQL_DATABASE=${var.mysql_database}",
  "MYSQL_USER=${var.mysql_user}",
  "MYSQL_PASSWORD=${var.mysql_password}"
]

  # Configuración de la red para integrarse con otros servicios
  networks_advanced {
    name    = var.network_name
    aliases = ["mysql"]
  }

  # Montar un volumen opcional para persistir los datos de la base de datos
  mounts {
    target = "/var/lib/mysql"
    source = "/home/giovanni/Documents/Terraform/Practica_3/modules/mysql/mysql_data"
    type   = "bind"
  }
}
