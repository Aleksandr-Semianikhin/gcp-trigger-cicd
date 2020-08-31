resource "google_compute_instance" "backend" {
  name         = "my-test-instance"
  machine_type = "f1-micro"
  zone         = "europe-west1-b"
  project      = "${var.app_project}"

  tags = ["backend"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
}