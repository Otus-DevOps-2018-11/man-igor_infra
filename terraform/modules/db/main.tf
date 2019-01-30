resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["reddit-db"]

  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "${var.db_disk_image}"
    }
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network       = "default"
    access_config = {}
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
}
