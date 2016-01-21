provider "dnsimple" {
    token = "${var.dnsimple_token}"
    email = "${var.dnsimple_email}"
}

resource "dnsimple_record" "web" {
    domain = "YOUR-DOMAIN-HERE"
    name = "YOUR-ENTRY-HERE"
    value = "${digitalocean_droplet.web.ipv4_address}"
    type = "A"
    ttl = 3600
}
