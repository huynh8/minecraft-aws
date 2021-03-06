variable "public_key" {}

variable "allowed_ips" {
  type = "list"
}

variable "region" {}

module "minecraft_server" {
  source = "minecraft-server"
  public_key = "${var.public_key}"
  allowed_ips = "${var.allowed_ips}"
  region = "${var.region}"
}
