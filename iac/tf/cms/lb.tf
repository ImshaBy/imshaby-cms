data "yandex_vpc_subnet" "default_subnet_lb" {
  name = var.subnet_name
}

resource "yandex_alb_target_group" "cms_alb_target_group" {
  name           = var.cms_target_group_name //

  target {
    subnet_id    = data.yandex_vpc_subnet.default_subnet_lb.id
    ip_address   = yandex_compute_instance.cms_app.network_interface.0.ip_address
  }
}

resource "yandex_alb_backend_group" "cms_backend_group" {
  name                     = var.cms_backend_group_name
  session_affinity {
    connection {
      source_ip = true
    }
  }

  http_backend {
    name                   = var.cms_back_end_name
    weight                 = 1
    port                   = 80
    target_group_ids       = [yandex_alb_target_group.cms_alb_target_group.id]
    load_balancing_config {
      panic_threshold      = 90
    }
    healthcheck {
      timeout              = "10s"
      interval             = "2s"
      healthy_threshold    = 10
      unhealthy_threshold  = 15
      http_healthcheck {
        path               = "/_health"
      }
    }
  }
}


resource "yandex_alb_http_router" "cms_http_router" {
  name   = var.cms_http_router_name
}

resource "yandex_alb_virtual_host" "cms_virtual_host" {
  name           = var.cms_virtual_host_name
  http_router_id = yandex_alb_http_router.cms_http_router.id
  authority = [var.cms_domain_name]
  # modify_request_headers {
  #   name = "X-Forwarded-Port"
  #   replace = "443"
  # }
  route {
    name = var.cms_route_name

    http_route {
      http_match {
        path {
          prefix = "/"
        }
      }
      http_route_action {
        backend_group_id = yandex_alb_backend_group.cms_backend_group.id
        timeout          = "3s"
        # prefix_rewrite    = "/"
      }
    }
  }
}


# resource "yandex_alb_load_balancer" "cms-alb" {
#   name        = var.cms_alb_name

#   network_id  = data.yandex_vpc_subnet.default_subnet_lb.network_id

#   allocation_policy {
#     location {
#       zone_id   = var.az
#       subnet_id = data.yandex_vpc_subnet.default_subnet_lb.id
#     }
#   }

#   listener {
#     name = var.cms_http_listener_name
#     endpoint {
#       address {
#         external_ipv4_address {
#             # address = yandex_vpc_address.alb_addr.external_ipv4_address.0.address
#         }
#       }
#       ports = [ 80 ]
#     }
#     http {
#       handler  {
#             http_router_id = yandex_alb_http_router.cms_http_router.id
#       }
#     }
#   }
#   log_options {
#     discard_rule {
#       http_code_intervals = ["HTTP_2XX"]
#       discard_percent = 75
#     }
#   }
# }