# SSH key variable used in terraform.tfvars
variable "ssh_key" {
}

# Token ID variable used in terraform.tfvars
variable "token_id" {
}

# Token secret variable used in terraform.tfvars
variable "token_secret" {
}

# Proxmox API URL
variable "api_url" {
}

# Proxmox Hostname
variable "proxmox_host_primary" {
  default = "hl-pve-01"
}

# Proxmox Hostname
variable "proxmox_host_secondary" {
  default = "hl-pve-02"
}


# Proxmox Storage
variable "storage_backend" {
  default = "local-lvm"
}

# Proxmox VM Template
variable "template_name" {
  default = "ubuntu-2404-template"
}

# Network Device
variable "nic_name" {
  default = "vmbr0"
}

# VLAN
variable "vlan_num" {
  default = "10"
}

# Proxmox Node 1 - Kubernetes VMID Offset
variable "hl1_k3s_offset" {
  default = 100
}

# Proxmox Node 2 - Kubernetes VMID Offset
variable "hl2_k3s_offset" {
  default = 200
}

# Proxmox Node 1 - Kubernetes Node Count
variable "hl1_k3s_count" {
  default = 3
}

# Proxmox Node 2 - Kubernetes Node Count
variable "hl2_k3s_count" {
  default = 2
}
