resource "proxmox_vm_qemu" "k3s" {
  name = "k3s-${format("%02d", count.index + 1)}"
  vmid = var.k3s_vmid + count.index + 1
  count = 3
  target_node = var.proxmox_host
  clone = var.template_name
  full_clone  = "true"

  agent = 1
  os_type = "cloud-init"
  ipconfig0 = "ip=dhcp"
  sshkeys = var.ssh_key

  cores = 2
  sockets = 1
  cpu = "host"
  memory = 4096
  balloon = 2048
  scsihw = "virtio-scsi-pci"
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
          size = "3584M"
          storage = var.storage_backend
          emulatessd = true
        }
      }
    }
  }

  network {
    model = "virtio"
    bridge = var.nic_name
    firewall = true
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}
