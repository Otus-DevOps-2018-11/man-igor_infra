provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "db" {
  source           = "../modules/db"
  enviroment       = "${var.enviroment}"
  zone             = "${var.zone}"
  db_disk_image    = "${var.db_disk_image}"
  public_key_path  = "${var.public_key_path}"
  private_key_path = "${var.private_key_path}"
}

module "app" {
  source           = "../modules/app"
  enviroment       = "${var.enviroment}"
  zone             = "${var.zone}"
  app_disk_image   = "${var.app_disk_image}"
  public_key_path  = "${var.public_key_path}"
  private_key_path = "${var.private_key_path}"
  db_internal_ip   = "${module.db.db_internal_ip}"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["95.220.173.198/32"]
}
