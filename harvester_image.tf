resource "harvester_image" "ubuntu20" {
  name      = "ubuntu20"
  namespace = "default"

  display_name = "ubuntu20"
  source_type  = "download"
  url          = "http://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
}

resource "harvester_image" "alpine315" {
  name      = "alpine-3.15"
  namespace = "default"

  display_name = "alpine-3.15"
  source_type  = "download"
  url          = "https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/x86_64/alpine-virt-3.15.0-x86_64.iso"
}
