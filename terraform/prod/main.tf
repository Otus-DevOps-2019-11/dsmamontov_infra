provider "google" {
  version = "~> 2.15"
  project = var.project
  region  = var.region
}

module "app" {
  source          = "./../modules/app"
  project         = var.project
  public_key_path = var.public_key_path
  label_env       = "prod"
}

module "db" {
  source          = "./../modules/db"
  public_key_path = var.public_key_path
  project         = var.project
  label_env       = "prod"
}

module "vpc" {
  source        = "./../modules/vpc"
  source_ranges = ["109.252.53.207/32"]
}
