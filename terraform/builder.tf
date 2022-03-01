resource "google_compute_instance" "builder" {
  name         = "builder"
  machine_type = "e2-medium"

  boot_disk {
    auto_delete = false
    source = google_compute_disk.builder.self_link
  }

  network_interface {
    subnetwork = google_compute_subnetwork.builders.name
    access_config {}
  }

  service_account {
    email  = google_service_account.builder-sa.email
    scopes = ["cloud-platform"]
  }

  scheduling {
    on_host_maintenance = "TERMINATE"
    preemptible         = true
    automatic_restart   = false
  }

  metadata_startup_script = <<EOT
    apt-get update
    apt-get -y upgrade
    apt-get -y install docker.io gcc git kafkacat make postgres-client-13
    curl -O https://dl.google.com/go/go1.17.linux-amd64.tar.gz
    tar zxvf go1.17.linux-amd64.tar.gz
    mv go /usr/local
    ln -s /usr/local/go/bin/go /usr/local/bin/go
    ln -s /usr/local/go/bin/gofmt /usr/local/bin/gofmt
    rm go1.17.linux-amd64.tar.gz
    EOT
}

resource "google_compute_disk" "builder" {
  name = "builder"
}
