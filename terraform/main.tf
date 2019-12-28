terraform {
  # Версия terraform
  required_version = "0.12.18"
}

provider "google" {
  version = "2.15.0"
  project = var.project
  region  = var.region
}

resource "google_compute_instance" "app" {
  name         = "reddit-app-${count.index}"
#  name         = "reddit-app"

  machine_type = "g1-small"
  zone         = var.zone_conn
  tags         = ["reddit-app"]

  count = var.count_vms

  metadata = {
    ssh-keys = "appuser:${file(var.public_key_path)} \nappuser1:${file(var.public_key_path1)} \nappuser2:${file(var.public_key_path2)}"
    
  }

  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  network_interface {
    network = "default"
 #   network_ip = "10.132.0.20"
    access_config {}
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }

  connection {
    type  = "ssh"
    host  = self.network_interface[0].access_config[0].nat_ip
    user  = "appuser"
    agent = false
    # путь до приватного ключа
    private_key = file(var.conn_pk)
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"
  # Название сети, в которой действует правило
  network = "default"
  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  # Каким адресам разрешаем доступ
  source_ranges = ["0.0.0.0/0"]
  # Правило применимо для инстансов с перечисленными тэгами
  target_tags = ["reddit-app"]
}