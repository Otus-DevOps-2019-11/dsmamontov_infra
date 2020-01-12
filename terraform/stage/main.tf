provider "google" {
  version = "~> 2.15"
  project = var.project
  region  = var.region
}

module "app" {
  source          = "./../modules/app"
  project         = var.project
  public_key_path = var.public_key_path
  #  zone            = var.zone_conn
  # app_disk_image = var.app_disk_image
  #  depends_on = [db, ]
}

module "db" {
  source          = "./../modules/db"
  public_key_path = var.public_key_path
  project         = var.project
  #  zone            = var.zone_conn
  # db_disk_image = var.db_disk_image
  # ip = var.my_ip
}

module "vpc" {
  source        = "./../modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}
