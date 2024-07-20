resource "proxmox_lxc" "lxc_infisical" {
  hostname        = "infisical"
  vmid        = var.hl1_lxc_offset + 3
  target_node = var.proxmox_host_primary
  ostemplate  = var.template_name
  unprivileged = true

  rootfs {
    storage = var.storage_backend
    size = "16G"
  }
  network {
    name    = "eth0"
    bridge   = var.nic_name
    firewall = false
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}