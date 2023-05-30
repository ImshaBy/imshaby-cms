//Network
az = "${AZ}"
service_acc_name = "${SERVICE_ACC_NAME}"
subnet_name = "${SUBNET_NAME}"

//  Server
cms_app_name = "${CMS_APP_NAME}"

// ALB
cms_target_group_name = "${CMS_TARGET_GROUP_NAME}"
cms_backend_group_name = "${CMS_BACKEND_GROUP_NAME}"
cms_back_end_name = "${CMS_BACK_END_NAME}"
cms_http_router_name = "${CMS_HTTP_ROUTER_NAME}"
cms_virtual_host_name = "${CMS_VIRTUAL_HOST_NAME}"
cms_route_name = "${CMS_ROUTE_NAME}"
cms_alb_name = "${CMS_ALB_NAME}"
cms_http_listener_name = "${CMS_HTTP_LISTENER_NAME}"


// CDN
cdn_origin_group_name = "${CDN_ORIGIN_GROUP_NAME}"
cms_dns_internal_name = "${CMS_DNS_INTERNAL_NAME}"
cms_domain_name = "${CMS_DOMAIN_NAME}"

// Provider Backend
dynamodb_table = "${DYNAMODB_TABLE}"
dynamodb_endpoint = "${DYNAMODB_ENDPOINT}"
secret_key = "${SA_SECRET_KEY}"
access_key = "${SA_ACCESS_KEY}"
tf_backend_key = "${TF_BACKEND_KEY}"
tr_backend_bucket_name = "${TR_BACKEND_BUCKET_NAME}"
