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

variable "ubuntu_20_04_lts_vgpu_v20211027" {
  description = "Ubuntu 20.04 LTS VGPU v20211027"
  type        = string
  default     = "fd80qm01ah03dkqb14lc"
}

variable "zone_ru_central1_a" {
  description = "yandex cloud zone"
  type        = string
  default     = "ru-central1-a"
}

variable "yc_auto_created_default_subnet_id" {
  description = "Auto-created def subnet 10.128.0.0/24 for zone ru-central1-a"
  type        = string
  default     = "e9bmsiue0hk5kl2dou85"
}

