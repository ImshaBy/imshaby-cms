terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = var.tr_backend_bucket_name
    region     = "ru-central1"
    key        = var.tf_backend_key
    access_key = var.access_key
    secret_key = var.secret_key
    dynamodb_endpoint =  var.dynamodb_endpoint
    dynamodb_table    = var.dynamodb_table
    skip_region_validation      = true
    skip_credentials_validation = true
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  alias = "yc_ru-central1-a"
  zone = var.az
}

