provider "google" {
  project     = var.project_id
  region      = var.region
  zone = "asia-southeast1-a"
  #credentials = file("./dark-quasar-435302-s7-4daaa08b483f.json")
}
