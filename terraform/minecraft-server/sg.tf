variable "allowed_ips" {
  type = "list"
}

resource "aws_security_group" "minecraft_security_group" {
  name = "Minecraft Security Group"
  description = "Allow incoming connections only for Minecraft and ssh for specific users"

  // allow everyone to connect to minecraft
  ingress {
    from_port = 25565
    to_port = 25565
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // allow everyone to connect to minecraft
  ingress {
    from_port = 25565
    to_port = 25565
    protocol = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // ssh from only ips you specify
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = "${var.allowed_ips}"
  }

  // download from anywhere
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
