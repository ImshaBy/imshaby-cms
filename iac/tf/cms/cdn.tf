
resource "yandex_cdn_origin_group" "cms_cdn_group" {
  name = var.cdn_origin_group_name
  use_next = true
  origin {
    # "${yandex_alb_load_balancer.identity-alb.listener[0].endpoint[0].address[0].external_ipv4_address[0].address}:81"
   source = "${yandex_compute_instance.cms_app.network_interface.0.nat_ip_address}:80"
  }
}


resource "yandex_cdn_resource" "cms_cdn_resource" {
    cname = "content.yc.imsha.by"
    origin_protocol = "http"
    active = true
    origin_group_id = yandex_cdn_origin_group.cms_cdn_group.id
    ssl_certificate {
        type = "lets_encrypt_gcore"
    }
    options {
        disable_cache = true
        # static_request_headers =["X-Forwarded-Port"]
    }
}