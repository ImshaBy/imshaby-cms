output "cms_external_ip" {
  value = yandex_compute_instance.cms_app.network_interface.0.nat_ip_address
}