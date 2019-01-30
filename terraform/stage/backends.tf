terraform {
  backend "gcs" {
    bucket = "otus-mybucket-2"
    prefix = "stage"
  }
}
