resource "yandex_compute_instance" "vm-1" {
  name = "chapter5-lesson2-pavel-parshin"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.ubuntu_20_04_lts_vgpu_v20211027
    }
  }

  network_interface {
    subnet_id = var.yc_auto_created_default_subnet_id
    nat       = false
}

  metadata = {
    user-data = "${file("/home/jarservice/example-01/meta.txt")}"
  }

}

