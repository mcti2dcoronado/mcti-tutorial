resource "google_compute_region_network_endpoint_group" "function_neg" {

  for_each = {
    neg-function-north-east       =   "northamerica-northeast1"
    neg-function-north-central    =   "us-central1"
    neg-function-north-east-1     =   "northamerica-northeast1"
    neg-function-north-central-1  =   "us-central1"
  }
  
  name                            =   "each.key"
  region                          =   "each.value"
  network_endpoint_type           =   "SERVERLESS"
  cloud_function {
    function = google_cloudfunctions_function.my_function_neg.name
  }

}

resource "google_cloudfunctions_function" "my_function_neg" {

  name  = "my-function-neg"
  runtime = "nodejs10"

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  timeout               = 60
  entry_point           = "helloGet"
}

resource "google_storage_bucket" "bucket" {
  name     = "my-function-net-bucket"
  location = "US"
}

resource "google_storage_bucket_object" "archive" {
  name   =   "code-zip"
  bucket =   google_storage_bucket.bucket.name
  source =   "./code.zip"
}
