terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.1-rc2"
    }
  }
}

provider "proxmox" {
  pm_api_url = var.api_url
  pm_api_token_id = var.token_id
  pm_api_token_secret = var.token_secret
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "homelab_apollo" {
  name = "homelab-apollo"
  target_node = var.proxmox_host
  clone = var.template_name
  full_clone  = "true"

  agent = 1
  os_type = "cloud-init"
  cloudinit_cdrom_storage = var.storage_backend
  ipconfig0 = "ip=dhcp"
  sshkeys = var.ssh_key

  cores = 2
  sockets = 1
  cpu = "x86-64-v2-AES"
  memory = 4096
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disks {
    scsi {
      scsi0 {
        disk {
          size = 32
          storage = var.storage_backend
          emulatessd = true
          discard = true
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
