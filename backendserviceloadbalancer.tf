resource "google_compute_backend_service" "my_backend_service" {
  for_each                        =  var.backend_name
  name                            =  "${each.key}-{each.value}"
  affinity_cookie_ttl_sec         =   0
  connection_draining_timeout_sec =   0
  load_balancing_scheme           =   "EXTERNAL_MANAGED"
  locality_lb_policy              =   "ROUND_ROBIN"
  port_name                       =   "http"
  project                         =   var.project_id
  protocol                        =   "HTTP"
  session_affinity                =   "NONE"
  timeout_sec                     =   30
  
  backend {
    for_each = google_compute_region_network_endpoint_group.function_neg
    group = each.name.self_link
  }
}
