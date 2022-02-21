resource "yandex_compute_instance" "vm-1" {
  name = var.chapter5_lesson2_pavel_parshin

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
    subnet_id = var.yc_network_id
    nat       = false
  }

  metadata = {
    user-data = var.yc_meta_file
  }

}

