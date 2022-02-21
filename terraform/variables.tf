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

variable "chapter5_lesson2_pavel_parshin" {
  description = "yandex cloud resource name"
  type        = string
  default     = "chapter5-lesson2-pavel-parshin"
}

variable "ubuntu_20_04_lts_vgpu_v20211027" {
  description = "Ubuntu 20.04 LTS VGPU v20211027"
  type        = string
  default     = "fd80qm01ah03dkqb14lc"
}

variable "yc_network_id" {
  description = "yandex cloud network id"
  type        = string
  default     = "e9bmsiue0hk5kl2dou85"
}

variable "yc_meta_file" {
  description = "metafile with users data creation"
  type        = string
  default     = "/home/jarservice/project/sausage-store/terraform/meta.txt"
}

