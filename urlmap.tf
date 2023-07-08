resource "google_compute_url_map" "my_url_map_serverless" {
  for_each          =   google_compute_backend_service.my_backend_service
  default_service   =   each.name.self_link
  name              =   "my_url_map_serverless"
  project           =    var.project_id
  host_rule {
    hosts        = ["montreal_college"]
    path_matcher = "path-matcher"
  }

  path_matcher {
    default_service = google_compute_backend_service.my_backend_service.my-backend-1-northamerica-northeast1.id
    name            = "path-matcher"

        path_rule {
        paths   = ["/fetchdata"]
        service = google_compute_backend_service.my_backend_service.my-backend-2-us-central1.id
        }
  }
}
