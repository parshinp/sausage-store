terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}


provider "yandex" {
  token     = "AQAEA7qh_PlhAATuwfgnK6_ghEqkj0q-hWVB9fM"
  cloud_id  = "b1g3jddf4nv5e9okle7p"
  folder_id = "b1gr4fhu1lstvqs3ad4l"
  zone      = "ru-central1-a"
}

resource "yandex_mdb_postgresql_cluster" "parshin-single-node-db" {
  name                = "parshin-single-node-db"
  environment         = "PRODUCTION"
  network_id          = yandex_vpc_network.ppnet.id
#  network_id          = "enpv2krbk8skcahr9q5q"
  security_group_ids  = [ yandex_vpc_security_group.pgsql-sg.id ]
  deletion_protection = true

  config {
    version = 12
    resources {
      resource_preset_id = "b2.nano"
      disk_type_id       = "network-ssd"
      disk_size          = "15"
    }
  }

  database {
    name  = "testdb"
    owner = "sa"
  }

  user {
    name     = "sa"
    password = "password"
    permission {
      database_name = "testdb"
    }
  }

  host {
    zone      = "ru-central1-a"
    subnet_id = yandex_vpc_subnet.ppsubnet.id
#    subnet_id = "e9bmsiue0hk5kl2dou85"
    assign_public_ip = true
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

