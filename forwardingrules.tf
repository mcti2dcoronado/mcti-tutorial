resource "google_compute_global_forwarding_rule" "my_forwarding_rule" {
  name                  =   "global-rule"
  target                =   google_compute_target_http_proxy.my_http_proxy_keep_alive.id
  port_range            =   "80"
  load_balancing_scheme =   "EXTERNAL_MANAGED"
}