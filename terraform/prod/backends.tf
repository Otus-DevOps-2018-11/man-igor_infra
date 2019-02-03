terraform {
  backend "gcs" {
    bucket = "otus-mybucket-1"
    prefix = "prod"
  }
}
