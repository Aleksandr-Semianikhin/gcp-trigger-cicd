resource "google_compute_network" "network" {
  name                    = "network"
  auto_create_subnetworks = true
  project 				= "${var.app_project}"
}

resource "google_compute_firewall" "test-firewall" {
  name    		= "test-firewall"
  network 		= "default"
  project      	= "${var.app_project}"

  allow {
    protocol = "http"
  }
  
  depends_on = ["google_compute_network.network"] 
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
    network = "network"
	
	access_config {
    }
  }
  
  depends_on = ["google_compute_network.network"] 
}