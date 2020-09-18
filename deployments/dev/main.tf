resource "google_compute_firewall" "test-firewall" {
  name    = "test-firewall"
  network = "default"

  allow {
    protocol = "http"
  }

  allow {
    protocol = "https"
  }
}

resource "google_compute_instance" "backend" {
  name         = "my-test-instance"
  machine_type = "f1-micro"
  zone         = "europe-west1-b"
  project      = "${var.app_project}"

  tags = ["backend"]
  
  
  metadata_startup_script = "${file("../install.sh")}"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-8"
    }
  }
  
  network_interface {
    network = "default"
	
	access_config {
    }
  }
}