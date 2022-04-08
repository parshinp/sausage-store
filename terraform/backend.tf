terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "pavel-parshin-backup"
    region     = "ru-central1"
    key        = "terraform/terraform.tfstate"
    access_key = var.s3_access_key
    secret_key = var.s3_secret_key

    skip_region_validation      = true
    skip_credentials_validation = true
  }

}
