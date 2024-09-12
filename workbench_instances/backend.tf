terraform {
  backend "gcs" {
    bucket = "terraform-gcs-bucket-raven-nest"
    prefix = "workbench-instances/state/"
  }
}
