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

# Cargar módulos de cada servicio
module "nginx" {
  source     = "./modules/nginx"
  nginx_port = var.nginx_port  # Asegúrate de pasar el puerto definido
}



module "nodejs" {
  source      = "./modules/nodejs"
  nodejs_port = var.nodejs_port
  db_host     = module.mysql.container_ip  # La IP de MySQL desde el output del módulo mysql
  db_port     = var.mysql_port
  db_user     = var.mysql_user
  db_pass     = var.mysql_password
}



module "mysql" {
  source            = "./modules/mysql"
  mysql_password    = var.mysql_password
  mysql_port        = var.mysql_port
  mysql_root_password = var.mysql_root_password
  mysql_database    = var.mysql_database
  mysql_user        = var.mysql_user
}


module "redis" {
  source = "./modules/redis"
}

module "traefik" {
  source = "./modules/traefik"
}
