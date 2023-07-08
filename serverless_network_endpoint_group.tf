resource "google_compute_region_network_endpoint_group" "function_neg" {

  for_each = {
    neg-function-north-east       =   "northamerica-northeast1"
    neg-function-north-central    =   "us-central1"
    neg-function-north-east-1     =   "northamerica-northeast1"
    neg-function-north-central-1  =   "us-central1"
  }
  
  name                            =   each.key
  region                          =   each.value
  network_endpoint_type           =   "SERVERLESS"
  cloud_function {
    function = google_cloudfunctions_function.my_function_neg.name
  }

}
