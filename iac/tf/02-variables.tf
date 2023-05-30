// Network

variable "subnet_name" {
  type        = string
}

variable "az" {
  type        = string
  default     = "ru-central1-a"
}


variable "service_acc_name" {
  type        = string
}

variable "cms_app_name" {
  type        = string
}

// Compute Instance
variable "platform_id" {
  type        = string
  default     = "standard-v3"
}


variable "cms_target_group_name" {
  type        = string
}
variable "cms_backend_group_name" {
  type        = string
}
variable "cms_back_end_name" {
  type        = string
}
variable "cms_http_router_name" {
  type        = string
}
variable "cms_virtual_host_name" {
  type        = string
}
variable "cms_domain_name" {
  type        = string
}
variable "cms_route_name" {
  type        = string
}
variable "cms_alb_name" {
  type        = string
}
variable "cms_http_listener_name" {
  type        = string
}
variable "cdn_origin_group_name" {
  type        = string
}
variable "cms_dns_internal_name" {
  type        = string
}
variable "tr_backend_bucket_name" {
  type        = string
}
variable "tf_backend_key" {
  type        = string
}
variable "access_key" {
  type        = string
}
variable "secret_key" {
  type        = string
}
variable "dynamodb_endpoint" {
  type        = string
}
variable "dynamodb_table" {
  type        = string
}
