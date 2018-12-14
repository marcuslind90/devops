resource "digitalocean_droplet" "web" {
    count = "${var.instance_count}"
    name = "web-${count.index + 1}"
    image = "ubuntu-18-04-x64"
    region = "ams3"
    size = "1gb"
    private_networking = true
    monitoring = true
    ssh_keys = [
        "${var.ssh_fingerprint}"
    ]

    lifecycle {
        create_before_destroy = true
    }

    connection {
        user = "root"
        type = "ssh"
        private_key = "${file(var.pvt_key)}"
        timeout = "2m"
    }
    provisioner "file" {
        source = "../nginx"
        destination = "~/"
    }

    provisioner "file" {
        source = "../docker-compose.prod.yml"
        destination = "~/docker-compose.yml"
    }

    provisioner "remote-exec" {
        inline = [
            "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done",
            "sudo apt-get update",
            "sudo apt-get -y install docker docker-compose",
            "sudo docker-compose up -d",
        ]
    }
}
