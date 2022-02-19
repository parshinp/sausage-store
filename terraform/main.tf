terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.71.0"
    }
  }
}

resource "yandex_compute_instance" "vm-1" {
  name = var.yc_res_name

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



