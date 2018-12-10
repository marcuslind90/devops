variable "do_token" {}
variable "pub_key" {}
variable "pvt_key" {}
variable "ssh_fingerprint" {}
variable "git_revision" {}

variable "instance_count" { default = 2 }

output "droplet_ids" {
    value = ["${digitalocean_droplet.web.*.id}"]
}
output "loadbalancer_id" {
    value = "${digitalocean_loadbalancer.public.id}"
}
