resource "yandex_compute_instance" "vm-1" {
  name = var.yc_res_name

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.yc_image_id
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

