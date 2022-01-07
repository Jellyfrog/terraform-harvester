resource "harvester_virtualmachine" "ubuntu20-dev" {
  depends_on = [harvester_image.ubuntu20, harvester_network.vlan59]

  name        = "ubuntu-dev"
  description = "test raw image"

  tags = {
    ssh-user = "ubuntu"
  }

  cpu    = 1
  memory = "1Gi"

  start        = true
  hostname     = "ubuntu-dev"
  machine_type = "q35"

  ssh_keys = [
    "jellyfrog"
  ]

  network_interface {
    name         = "nic-1"
    model        = "virtio"
    type         = "bridge"
    network_name = "default/vlan59"
  }

  disk {
    name       = "rootdisk"
    type       = "disk"
    size       = "10Gi"
    bus        = "virtio"
    boot_order = 1

    image       = "default/ubuntu20"
    auto_delete = true
  }

  cloudinit {
    user_data    = <<-EOF
      #cloud-config
      user: ubuntu
      password: ubuntu
      chpasswd:
        expire: false
      ssh_pwauth: true
      package_update: true
      packages:
        - qemu-guest-agent
      runcmd:
        - - systemctl
          - enable
          - '--now'
          - qemu-guest-agent
      ssh_authorized_keys:
        - >-
          your ssh public key
      EOF
    network_data = ""
  }
}
