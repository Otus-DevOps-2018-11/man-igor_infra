resource "google_compute_instance" "db" {
  name         = "reddit-db-${var.enviroment}"
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

  connection {
    type        = "ssh"
    user        = "appuser"
    agent       = false
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "remote-exec" {
  inline = [
    "sudo sed -i 's/127.0.0.1/${google_compute_instance.db.network_interface.0.address}/' /etc/mongod.conf",
    "sudo systemctl restart mongod.service",
    ]
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
}
