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
variable "proxmox_host" {
  default = "homelab"
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

# Kubernetes Cluster VMID
variable "k3s_vmid" {
  default = 200
}