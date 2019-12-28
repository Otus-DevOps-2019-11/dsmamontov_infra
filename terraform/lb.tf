
resource "google_compute_instance_group" "us-lb-gr" {
  name = "us-ig1"
  instances = [
  for i in google_compute_instance.app:
    i.self_link
  ]
  zone = var.zone_conn
}

resource "google_compute_health_check" "my-health-check" {
  name = "my-health-check"
  timeout_sec        = 1
  check_interval_sec = 1
  http_health_check {
    request_path = "/"
    port = 9292
  }
}

resource "google_compute_http_health_check" "default" {
  name               = "default"
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
  port               = 9292
}

resource "google_compute_target_pool" "default" {
  name = "instance-pool"

  instances = [
  for i in google_compute_instance.app:
    i.self_link
  ]

  health_checks = [
    google_compute_http_health_check.default.self_link,
  ]
}

resource "google_compute_region_backend_service" "my-lb-back" {
  name          = "my-lb-back"
  health_checks = [google_compute_health_check.my-health-check.self_link]
  region        = var.region
  backend {
    group = google_compute_instance_group.us-lb-gr.self_link
  }
}

resource "google_compute_forwarding_rule" "my-lb-forwarding-rule" {
  name                  = "my-lb-forwarding-rule"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "9292"
  target                =  google_compute_target_pool.default.self_link
#  ports                 = ["80"]
#  backend_service       = google_compute_region_backend_service.my-lb-back.self_link
}
