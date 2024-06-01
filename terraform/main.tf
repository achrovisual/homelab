module "k3s" {
    source = "./modules/k3s"
    api_url = var.api_url
    token_id = var.token_id
    token_secret = var.token_secret
    ssh_key = var.ssh_key
}