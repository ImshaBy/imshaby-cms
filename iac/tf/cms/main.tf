terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

}


provider "yandex" {
  alias = "yc_ru-central1-a"
  zone = var.az
}

data "yandex_compute_image" "container-optimized-image" {
  family = "container-optimized-image"
}

data "yandex_vpc_subnet" "default_subnet" {
  name = var.subnet_name
}

data "yandex_iam_service_account" "deployer" {
  name = var.service_acc_name
}

# ресурс "yandex_compute_instance" т.е. сервер
resource "yandex_compute_instance" "cms_app" {
  name = var.cms_app_name
  zone = var.az
  platform_id = var.platform_id
  resources {
    cores  = 2 # vCPU
    memory = 2 # RAM
  }

  boot_disk {
    auto_delete = true
    initialize_params {
      image_id = data.yandex_compute_image.container-optimized-image.id
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.default_subnet.id # одна из дефолтных подсетей
    nat = true # автоматически установить динамический ip
  }

  service_account_id = data.yandex_iam_service_account.deployer.id
  hostname = var.cms_dns_internal_name
  metadata = {
    # postgress_user = var.postgress_user
    # database_host = var.database_host
    # database_username = var.database_user
    # database_password = var.database_password
    # postgress_password = var.postgress_password
    docker-compose = file("${path.module}/tf_docker-compose.yml")
    user-data = file("cloud_config.yaml")
  }

}

