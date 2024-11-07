terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.25.0"
    }
  }
}

# Crear la imagen de Docker para Node.js
resource "docker_image" "nodejs" {
  name = "node:latest"  # Especifica la versión de Node.js que deseas usar
}

# Crear el contenedor de Docker para Node.js
resource "docker_container" "nodejs" {
  name  = "nodejs_container"
  image = docker_image.nodejs.image_id

  ports {
    internal = 3000
    external = var.nodejs_port
  }

  # Montaje del volumen para el código fuente
  # Asegúrate de tener una carpeta "app" en "terraform_project/modules/nodejs"
  mounts {
    source      = "/home/giovanni/Documents/Terraform/Practica_3/modules/nodejs/app"   # Directorio local del código de la aplicación
    target      = "/usr/src/app"         # Directorio dentro del contenedor
    type   = "bind"
  }

  # Directorio de trabajo
  working_dir = "/usr/src/app"

  # Comando de inicio de la aplicación
  command = ["npm", "start"]


  # Configuración de red
  networks_advanced {
    name    = "web_network"
    aliases = ["nodejs"]
  }

  # Variables de entorno para conectar a la base de datos
  env = [
  "NODE_ENV=production",
  "DB_HOST=${var.db_host}",
  "DB_PORT=${var.db_port}",
  "DB_USER=${var.db_user}",
  "DB_PASS=${var.db_pass}",
]
}
