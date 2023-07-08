resource "google_storage_bucket" "bucket" {
  name     = "my-function-net-bucket"
  location = "US"
}


resource "google_storage_bucket_object" "archive" { 
  name   =   "code-zip"
  bucket =   google_storage_bucket.bucket.name
  source =   "./code.zip"
}
