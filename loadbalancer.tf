resource "google_compute_target_http_proxy" "my_http_proxy_keep_alive" {
  name                        = "my-http-proxy-keep-alive"
  http_keep_alive_timeout_sec = 120
  url_map                     = google_compute_url_map.my_url_map_serverless.id
}