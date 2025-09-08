provider "aws" {
  region     = "ap-northeast-3"
  access_key = "AKIA3FLD562R6AKXVXU6"
  secret_key = "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"
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
