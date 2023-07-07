resource "google_compute_region_network_endpoint_group" "negfetchdata1" {
  name                  = "negfetchdata1"
  network_endpoint_type = "SERVERLESS"
  region                = "us-central1"
  project = var.project_id
  cloud_function {
    function = "fetchData"
  }
}
resource "google_compute_region_network_endpoint_group" "negfetchdata2" {
  name                  = "negfetchdata2"
  network_endpoint_type = "SERVERLESS"
  region                = "northamerica-northeast1"
  cloud_function {
    function = "fetchData"
  }
  project = var.project_id
}
