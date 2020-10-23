resource "google_compute_firewall" "allow-http" {
    name = "additional-allow-http"
    network = "default"

    allow {
        protocol = "tcp"
        ports = ["8081"]
    }

    source_ranges = [
      "0.0.0.0/0"
    ]
    target_tags = [
      "http-server",
    ]
}

resource "google_compute_instance" "backend" {
  name         = "my-test-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  project      = "${var.app_project}"

  tags = ["http-server"]
  
  
  metadata_startup_script = "${file("../install.sh")}"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-8"
    }
  }
  
  network_interface {
    network = "default"
	
	access_config {}
  }
  
}