# variables file_
variable "my_yc_token" {
  description = "My yandex cloud token"
  type        = string
  sensitive   = true
}

variable "yandex_cloud_praktikum_devops_course" {
  description = "yandex cloud id"
  type        = string
  default     = "b1g3jddf4nv5e9okle7p"
}

variable "yandex_cloud_students_2nd_stream" {
  description = "folder id"
  type        = string
  default     = "b1gr4fhu1lstvqs3ad4l"
}

variable "zone_ru_central1_a" {
  description = "yandex cloud zone"
  type        = string
  default     = "ru-central1-a"
}
