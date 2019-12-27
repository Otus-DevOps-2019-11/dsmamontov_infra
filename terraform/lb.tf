
resource "google_compute_instance_group" "us-lb-gr" {
  name = "us-ig1"
  instances = [
  for i in google_compute_instance.app:
    i.self_link
  ]
  zone = var.zone_conn
}

resource "google_compute_health_check" "my-tcp-health-check" {
  name = "my-tcp-health-check"
  http_health_check {
    request_path = "/"
    port = 9292
  }
}

resource "google_compute_region_backend_service" "my-lb-back" {
  name          = "my-lb-back"
  health_checks = [google_compute_health_check.my-tcp-health-check.self_link]
  region        = var.region
  backend {
    group = google_compute_instance_group.us-lb-gr.self_link
  }
}

#resource "google_compute_forwarding_rule" "my-lb-forwarding-rule" {
#  name                  = "my-lb-forwarding-rule"
#  load_balancing_scheme = "EXTERNAL"
#  ports                 = ["80"]
#  backend_service       = google_compute_region_backend_service.my-lb-back.self_link
#}
