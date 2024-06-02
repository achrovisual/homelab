resource "proxmox_vm_qemu" "k3s_admin" {
  name        = "k3s-admin"
  vmid        = var.hl1_k3s_offset + 1
  target_node = var.proxmox_host_primary
  clone       = var.template_name
  full_clone  = "true"

  agent     = 1
  os_type   = "cloud-init"
  ipconfig0 = "ip=dhcp"
  sshkeys   = var.ssh_key

  cores    = 2
  sockets  = 1
  cpu      = "host"
  memory   = 1024
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disks {
    ide {
      ide2 {
        cloudinit {
          storage = var.storage_backend
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size       = "3584M"
          storage    = var.storage_backend
          emulatessd = true
        }
      }
    }
  }

  network {
    model    = "virtio"
    bridge   = var.nic_name
    firewall = true
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}

resource "proxmox_vm_qemu" "k3s_nodes_small" {
  name        = "k3s-${format("%02d", count.index + 1)}"
  vmid        = var.hl1_k3s_offset + 1 + count.index + 1
  count       = var.hl1_k3s_count
  target_node = var.proxmox_host_primary
  clone       = var.template_name
  full_clone  = "true"

  agent     = 1
  os_type   = "cloud-init"
  ipconfig0 = "ip=dhcp"
  sshkeys   = var.ssh_key

  cores    = 2
  sockets  = 1
  cpu      = "host"
  memory   = 2048
  balloon  = 1024
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disks {
    ide {
      ide2 {
        cloudinit {
          storage = var.storage_backend
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size       = "3584M"
          storage    = var.storage_backend
          emulatessd = true
        }
      }
    }
  }

  network {
    model    = "virtio"
    bridge   = var.nic_name
    firewall = true
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}

resource "proxmox_vm_qemu" "k3s_nodes_medium" {
  name        = "k3s-${format("%02d", count.index + 1 + var.hl1_k3s_count)}"
  vmid        = var.hl2_k3s_offset + count.index + 1
  count       = 2
  target_node = var.proxmox_host_secondary
  clone       = var.template_name
  full_clone  = "true"

  agent     = 1
  os_type   = "cloud-init"
  ipconfig0 = "ip=dhcp"
  sshkeys   = var.ssh_key

  cores    = 2
  sockets  = 1
  cpu      = "host"
  memory   = 4096
  balloon  = 2048
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disks {
    ide {
      ide2 {
        cloudinit {
          storage = var.storage_backend
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size       = "3584M"
          storage    = var.storage_backend
          emulatessd = true
        }
      }
    }
  }

  network {
    model    = "virtio"
    bridge   = var.nic_name
    firewall = true
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}
