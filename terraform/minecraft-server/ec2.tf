resource "aws_instance" "minecraft_server" {
  ami = "0ec1948d5caef658a"
  instance_type = "m5.large"
  availability_zone = "us-east-2"
  security_groups = ["${aws_security_group.minecraft_security_group.id}"]
}

variable "public_key" {}

resource "aws_key_pair" "" {
  public_key = "${file(${var.public_key})}"
}

output "minecraft_ip" {
  value = "${aws_instance.minecraft_server.public_ip}"
}
