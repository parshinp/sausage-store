terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "pavel-parshin-backup"
    region     = "ru-central1"
    key        = "terraform/terraform.tfstate"
    access_key = "pmnNK3SV0XCEjPiqZjy5"
    secret_key = "70ntqTOnslN2-kQYBvFC1GVlQY_apCiHp0gCaujp"

    skip_region_validation      = true
    skip_credentials_validation = true
  }

}
