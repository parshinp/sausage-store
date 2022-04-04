

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
#  zone      = "ru-central1-a"
}

resource "yandex_mdb_postgresql_cluster" "parshin-ha-node-db" {
  name                = "parshin-ha-node-db"
  environment         = "PRODUCTION"
  network_id          = yandex_vpc_network.pp1net.id
  security_group_ids  = [yandex_vpc_security_group.pgsql-sg1.id]
  deletion_protection = false

  config {
    version = 13
    resources {
      resource_preset_id = "s2.micro"
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

  user {
    name     = "admin_user"
    password = "password"
    permission {
      database_name = "testdb"
    }
  }

  user {
    name     = "read_user"
    password = "password"
    permission {
      database_name = "testdb"
    }
  }

  user {
    name     = "write_user"
    password = "password"
    permission {
      database_name = "testdb"
    }
  }


  host {
    zone             = "ru-central1-a"
    subnet_id        = yandex_vpc_subnet.pp1subnet.id
    assign_public_ip = true
  }

  host {
    zone             = "ru-central1-b"
    subnet_id        = yandex_vpc_subnet.pp2subnet.id
    assign_public_ip = true
  }
}

resource "yandex_vpc_network" "pp1net" {
  name = "pp1net"
}

resource "yandex_vpc_subnet" "pp1subnet" {
  name           = "pp1subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.pp1net.id
  v4_cidr_blocks = ["10.128.0.0/24"]
}

resource "yandex_vpc_subnet" "pp2subnet" {
  name           = "pp2subnet"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.pp1net.id
  v4_cidr_blocks = ["10.129.0.0/24"]
}

resource "yandex_vpc_security_group" "pgsql-sg1" {
  name       = "pgsql-sg1"
  network_id = yandex_vpc_network.pp1net.id

  ingress {
    description    = "PostgreSQL"
    port           = 6432
    protocol       = "TCP"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

