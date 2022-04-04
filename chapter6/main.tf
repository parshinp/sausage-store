terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_vpc_network" "ppnet" {
  name = "ppnet"
}

resource "yandex_vpc_subnet" "ppsubnet" {
  name           = "ppsubnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.ppnet.id
#  network_id     = "enpv2krbk8skcahr9q5q"
  v4_cidr_blocks = ["10.128.0.0/24"]
}

resource "yandex_vpc_security_group" "pgsql-sg" {
  name       = "pgsql-sg"
  network_id = yandex_vpc_network.ppnet.id
#  network_id  = "enpv2krbk8skcahr9q5q"
  
  ingress {
    description    = "PostgreSQL"
    port           = 6432
    protocol       = "TCP"
    v4_cidr_blocks = [ "0.0.0.0/0" ]
  }
}

