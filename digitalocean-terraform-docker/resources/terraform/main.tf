variable "do_token" {}
variable "pub_key" {}
variable "pvt_key" {}
variable "ssh_fingerprint" {}

variable "git_revision" {}
variable "instance_count" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

module "web" {
    source = "./web"
    do_token = "${var.do_token}"
    pub_key = "${var.pub_key}"
    pvt_key = "${var.pvt_key}"
    ssh_fingerprint = "${var.ssh_fingerprint}"
    git_revision = "${var.git_revision}"
    instance_count = "${var.instance_count}"
}

module "network" {
    source = "./network"
    droplet_ids = ["${module.web.droplet_ids}"]
    loadbalancer_id = "${module.web.loadbalancer_id}"
}
