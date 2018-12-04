resource "digitalocean_firewall" "web" {
    name = "web"
    droplet_ids = ["${var.droplet_ids}"],
    inbound_rule = [
        {
            protocol           = "tcp"
            port_range         = "80"
            source_addresses   = ["0.0.0.0/0", "::/0"]
        },
        {
            protocol           = "tcp"
            port_range         = "443"
            source_addresses   = ["0.0.0.0/0", "::/0"]
        },
        {
            protocol           = "icmp"
            source_addresses   = ["0.0.0.0/0", "::/0"]
        },
    ],
    outbound_rule = [
        {
            protocol                = "tcp"
            port_range              = "53"
            destination_addresses   = ["0.0.0.0/0", "::/0"]
        },
        {
            protocol                = "udp"
            port_range              = "53"
            destination_addresses   = ["0.0.0.0/0", "::/0"]
        },
        {
            protocol                = "icmp"
            destination_addresses   = ["0.0.0.0/0", "::/0"]
        },
    ]
}