terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.71.0"
    }
  }
}

provider "yandex" {
  token     = "AQAEA7qh_PlhAATuwfgnK6_ghEqkj0q-hWVB9fM"
  cloud_id  = "b1g3jddf4nv5e9okle7p"
  folder_id = "b1gr4fhu1lstvqs3ad4l"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "vm-1" {
  name = "chapter5-lesson2-pavel-parshin"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80qm01ah03dkqb14lc"
    }
  }

  network_interface {
    subnet_id = "e9bmsiue0hk5kl2dou85"
    nat       = false
  }

  metadata = {
    user-data = "${file("/home/jarservice/example-01/meta.txt")}"
  }

}

output "ip_address" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}



