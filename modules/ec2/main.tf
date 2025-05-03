## to create the key pair using terraform
# resource "aws_key_pair" "example" {
#   key_name   = "example-key"  # The name for your key pair
#   public_key = file("~/.ssh/id_rsa.pub")  # Path to your existing public key
# }

resource "aws_instance" "server-1" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.key       ##key_name   = aws_key_pair.example.key_name  # Reference the key pair created above
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }
  user_data = file("${path.module}/main.sh")
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = var.aws_security_group

    tags = {
        Name = "project-angularjava"
    }
}
