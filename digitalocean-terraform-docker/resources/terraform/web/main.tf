variable "do_token" {}
variable "pub_key" {}
variable "pvt_key" {}
variable "ssh_fingerprint" {}

output "droplet_ids" {
    value = ["${digitalocean_droplet.web1.id}"]
}
