// Network

variable "subnet_name" {
  type        = string
}


variable "network_id" {
  type        = string
}

variable "network_name" {
  type        = string
  description = "Id of network in AZ"
  default     = "default"
}

variable "zone_name" {
  type        = string
  default     = "default"
}

variable "zone" {
  type        = string
  default     = "default"
}

variable "az" {
  type        = string
  default     = "ru-central1-a"
}

variable "db_dns_internal_name" {
  type        = string
}


// Compute Instance
variable "platform_id" {
  type        = string
  default     = "standard-v3"
}

// Postgress DB
variable "postgress_user" {
  type        = string
  default     = "admin"
}
variable "postgress_password" {
  type        = string
  default     = "pass"
}
variable "database_host" {
  type        = string
  default     = "localhost"
}
variable "db_disk_name" {
}

// API Server
variable "service_acc_name" {
  type        = string
}

variable "cms_app_name" {
  type        = string
}
variable "database_password" {
  type        = string
  default     = ""
}
variable "database_user" {
  type        = string
  default     = ""
}

// DB Server
variable "db_instance_name" {
  type        = string
  default     = "db-instances"
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
variable "cms_sni_handler_name" {
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
