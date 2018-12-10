resource "digitalocean_droplet" "web" {
    count = 2
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
            "export PATH=$PATH:/usr/bin",
            # install nginx
            "sudo apt-get update",
            "sudo apt-get -y install nginx"
        ]
    }
}