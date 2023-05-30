
module yc_cms {
  source = "./cms"
  az = var.az
  platform_id = var.platform_id
  subnet_name = var.subnet_name
  cms_app_name = var.cms_app_name
  cdn_origin_group_name = var.cdn_origin_group_name
  service_acc_name = var.service_acc_name
  cms_dns_internal_name = var.cms_dns_internal_name
  cms_target_group_name = var.cms_target_group_name
  cms_backend_group_name = var.cms_backend_group_name
  cms_back_end_name = var.cms_back_end_name
  cms_http_router_name = var.cms_http_router_name
  cms_virtual_host_name = var.cms_virtual_host_name
  cms_domain_name = var.cms_domain_name
  cms_route_name = var.cms_route_name
  cms_alb_name = var.cms_alb_name
  cms_http_listener_name = var.cms_http_listener_name
}

