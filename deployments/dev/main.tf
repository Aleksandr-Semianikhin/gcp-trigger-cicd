resource "google_compute_instance" "backend" {
  name         = "my-test-instance"
  machine_type = "n1-standart-1"
  zone         = "us-central1-a"
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
		nat_ip = "${var.nat_ip}"
    }
  }
  
  depends_on = ["google_compute_network.network"] 
}