#provider file_
provider "yandex" {
  token     = var.my_yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = var.zone_ru_central1_a
}

