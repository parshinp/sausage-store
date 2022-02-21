# variables file_
variable "yc_token" {
  description = "yandex cloud token"
  type        = string
  sensitive   = true
}

variable "yc_cloud_id" {
  description = "yandex cloud id"
  type        = string
  default     = "b1g3jddf4nv5e9okle7p"
}

variable "yc_folder_id" {
  description = "folder id"
  type        = string
  default     = "b1gr4fhu1lstvqs3ad4l"
}

variable "yc_zone" {
  description = "yandex cloud zone"
  type        = string
  default     = "ru-central1-a"
}

variable "yc_res_name" {
  description = "yandex cloud resource name"
  type        = string
  default     = "chapter5-lesson2-pavel-parshin"
}

variable "yc_image_id" {
  description = "yandex cloud image id"
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
  default     = "/home/jarservice/example-01/meta.txt"
# default     = "${file("/home/jarservice/example-01/meta.txt")}"
}

