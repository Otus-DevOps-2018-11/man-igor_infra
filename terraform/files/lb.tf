resource "google_compute_http_health_check" "reddithealth" {
  name               = "reddithealth"
  request_path       = "/"
  port               = "9292"
  check_interval_sec = 1
  timeout_sec        = 1
}

resource "google_compute_target_pool" "redditapp" {
  name = "reddit-pool"

  instances = [
    "europe-west1-b/reddit-app-1",
    "europe-west1-b/reddit-app-2",
  ]

  health_checks = [
    "${google_compute_http_health_check.reddithealth.name}",
  ]
}

resource "google_compute_forwarding_rule" "redditlbrule" {
  name       = "monolith-forwarding-rule"
  target     = "${google_compute_target_pool.redditapp.self_link}"
  port_range = "9292"
}
