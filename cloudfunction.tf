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
