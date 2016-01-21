resource "digitalocean_droplet" "web" {
    image = "ubuntu-14-04-x64"
    name = "webserver"
    region = "tor1"
    size = "512mb"
    #count = 1
    ssh_keys = [
      "14:72:4f:e9:2a:ff:6f:21:13:4c:57:e4:ad:38:6a:33"
    ]

    connection {
      user = "root"
      type = "ssh"
      key_file = "${var.pvt_key}"
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

output "ipv4" {
    value = "${digitalocean_droplet.web.ipv4_address}"
}
