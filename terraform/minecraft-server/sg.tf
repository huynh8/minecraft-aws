variable "allowed_ips" {
  type = "list"
}

resource "aws_security_group" "minecraft_security_group" {
  name = "Minecraft Security Group"
  description = "Allow incoming connections only for Minecraft and ssh for specific users"

  ingress {
    from_port = 25565
    to_port = 25565
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 25565
    to_port = 25565
    protocol = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 2
    to_port = 2
    protocol = "tcp"
    cidr_blocks = "${var.allowed_ips}"
  }
}