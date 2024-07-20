# Token ID variable used in terraform.tfvars
variable "token_id" {
}

# Token secret variable used in terraform.tfvars
variable "token_secret" {
}

# Proxmox API URL
variable "api_url" {
}


# SSH key variable used in terraform.tfvars
variable "ssh_key" {
}

# Proxmox Hostname
variable "proxmox_host_primary" {
  default = "hl-pve-01"
}

# Proxmox Storage
variable "storage_backend" {
  default = "local-lvm"
}

# Proxmox VM Template
variable "template_name" {
  default = "local:debian-12-standard_12.2-1_amd64.tar.zst"
}

# Network Device
variable "nic_name" {
  default = "vmbr0"
}

# VLAN
variable "vlan_num" {
  default = "10"
}

# Proxmox Node 1 - LXC VMID Offset
variable "hl1_lxc_offset" {
  default = "600"
}