provider "aws" {
  region = "us-east-1"
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com" # outra opção "https://ifconfig.me"
}

resource "aws_instance" "docker" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.chave_ssh_public.key_name
  associate_public_ip_address = true
  tags = {
    Name = "host_docker"
  }
  vpc_security_group_ids = [aws_security_group.acessos_dockers.id]
}

  resource "aws_key_pair" "chave_ssh_public" {
  key_name   = "chave_ssh"
  public_key = "${var.public_key}"
}

variable "public_key" {
  default = ""
}

resource "aws_security_group" "acessos_dockers" {
  name        = "acessos_dockers"
  description = "acessos inbound traffic"

  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = null,
      security_groups: null,
      self: null
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"],
      prefix_list_ids = null,
      security_groups: null,
      self: null,
      description: "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "allow_ssh"
  }
}

output "aws_instance_e_ssh" {
  value = aws_instance.docker.public_dns
}
