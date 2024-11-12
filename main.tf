# main.tf

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.25.0"
    }
  }
}


provider "docker" {}



# Crear la red solo una vez en el archivo raíz
resource "docker_network" "web_network" {
  name = "web_network"
}

resource "docker_network" "traefik_network" {
  name = "traefik_network"
}


# Cargar módulos de cada servicio
module "nginx" {
  source     = "./modules/nginx"
  nginx_port = var.nginx_port  # Asegúrate de pasar el puerto definido
  network_name = docker_network.web_network.name
  depends_on = [docker_network.web_network]
}



module "nodejs" {
  source      = "./modules/nodejs"
  nodejs_port = var.nodejs_port
  db_host     = module.mysql.container_ip  # La IP de MySQL desde el output del módulo mysql
  db_port     = var.mysql_port
  db_user     = var.mysql_user
  db_pass     = var.mysql_password

  network_name = docker_network.web_network.name
  depends_on = [docker_network.web_network]
}



module "mysql" {
  source            = "./modules/mysql"
  mysql_password    = var.mysql_password
  mysql_port        = var.mysql_port
  mysql_root_password = var.mysql_root_password
  mysql_database    = var.mysql_database
  mysql_user        = var.mysql_user

  network_name = docker_network.web_network.name
  depends_on = [docker_network.web_network]
}


module "redis" {
  source = "./modules/redis"
  network_name = docker_network.web_network.name
  depends_on = [docker_network.web_network]
}

module "traefik" {
  source = "./modules/traefik"
  web_network = docker_network.web_network.name
  traefik_network = docker_network.traefik_network.name
  depends_on = [docker_network.web_network, docker_network.traefik_network]
}
