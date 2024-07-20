module "k3s" {
    source = "./modules/k3s"

    api_url = var.api_url
    token_id = var.token_id
    token_secret = var.token_secret

    ssh_key = var.ssh_key
    hl1_k3s_admin_mac_address = var.hl1_k3s_admin_mac_address
    hl1_k3s_mac_addresses = var.hl1_k3s_mac_addresses
}

module "lxc" {
    source = "./modules/lxc"

    api_url = var.api_url
    token_id = var.token_id
    token_secret = var.token_secret

    ssh_key = var.ssh_key
}