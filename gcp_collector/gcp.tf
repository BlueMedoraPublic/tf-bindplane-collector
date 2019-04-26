provider "google" {
  version = "2.5"
}

provider "template" {
  version = "2.1"
}

data "template_file" "user_data" {
  template = "${file("${path.module}/../scripts/${var.userdata_script}")}"

  vars {
    api_key        = "${var.bindplane_api_key}"
    collector_name = "${var.collector_name}"
  }
}

resource "google_compute_instance" "collector" {
  name         = "${var.collector_name}-${terraform.workspace}"
  project      = "${var.project}"
  machine_type = "${var.compute_instance_size}"
  zone         = "${var.network_zone}"

  boot_disk {
    initialize_params {
      image = "${var.compute_image}"
      size  = "${var.disk_size}"
      type  = "${var.disk_type}"
    }
  }

  network_interface {
    network = "${var.network}"

    access_config {
      // leave emtpy in order to get a public ip
    }
  }

  metadata_startup_script = "${data.template_file.user_data.rendered};"
}
