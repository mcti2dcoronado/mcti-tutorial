resource "google_compute_backend_service" "backendfetchdata" {
  connection_draining_timeout_sec = 0
  load_balancing_scheme           = "EXTERNAL_MANAGED"
  locality_lb_policy              = "ROUND_ROBIN"
  name                            = "backendfetchdata"
  port_name                       = "http"
  project                         = var.project_id
  protocol                        = "HTTPS"
  session_affinity                = "NONE"
  timeout_sec                     = 30
    backend {
    group = google_compute_region_network_endpoint_group.negfetchdata1.self_link
  }

  backend {
    group = google_compute_region_network_endpoint_group.negfetchdata2.self_link
  }
}
