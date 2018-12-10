resource "digitalocean_droplet" "web" {
    count = "${var.instance_count}"
    name = "web-${count.index + 1}"
    image = "ubuntu-18-04-x64"
    region = "ams3"
    size = "512mb"
    private_networking = true
    monitoring = true
    ssh_keys = [
        "${var.ssh_fingerprint}"
    ]

    connection {
        user = "root"
        type = "ssh"
        private_key = "${file(var.pvt_key)}"
        timeout = "2m"
    }

    provisioner "remote-exec" {
        inline = [
            "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done",
            "sudo apt-get update",
            "sudo apt-get -y install docker docker-compose",
        ]
    }
}

resource "null_resource" "deploy" {
    depends_on = ["digitalocean_droplet.web"]
    count = "${var.instance_count}"

    triggers {
        git_revision = "${var.git_revision}"
        droplet_ids = "${join(",", digitalocean_droplet.web.*.id)}"
    }

    connection {
        user = "root"
        type = "ssh"
        private_key = "${file(var.pvt_key)}"
        timeout = "2m"
        host = "${element(digitalocean_droplet.web.*.ipv4_address, count.index)}"
    }

    provisioner "file" {
        source = "../nginx/"
        destination = "~/nginx/"
    }

    provisioner "file" {
        source = "../docker-compose.prod.yml"
        destination = "~/docker-compose.yml"
    }

    provisioner "remote-exec" {
        inline = [
            "export HOST=${count.index}",
            "sudo docker-compose up -d",
        ]
    }
}