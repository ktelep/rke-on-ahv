resource "tls_private_key" "rke_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "rke_private_ssh_key" {
  content         = chomp(tls_private_key.rke_ssh_key.private_key_pem)
  filename        = local.ssh_key_default_name
  file_permission = "0600"
}

resource "local_file" "rke_public_ssh_key" {
  content  = chomp(tls_private_key.rke_ssh_key.public_key_openssh)
  filename = "${local.ssh_key_default_name}.pub"
}
