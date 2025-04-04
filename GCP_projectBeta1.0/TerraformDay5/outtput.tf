output "idcomputengine" {
  value = google_compute_instance.vm_instance.instance_id
}

output "networkips" {
  value = google_compute_network.vpc_network.network_firewall_policy_enforcement_order
}

output "bucket" {
  value = google_storage_bucket.static-site.project_number
}