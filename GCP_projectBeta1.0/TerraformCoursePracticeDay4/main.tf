resource "google_storage_bucket" "static-site" {
  name          = "nahumponcebuckettest"
  location      = "EU"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true
}

resource "google_storage_bucket" "static-site2" {
  name          = "nahumponcebuckettest2"
  location      = "EU"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true
}
