#provider file_
provider "yandex" {
  token     = var.my_yc_token
  cloud_id  = var.yandex_cloud_praktikum_devops_course
  folder_id = var.yandex_cloud_students_2nd_stream
  zone      = var.zone_ru_central1_a
}

