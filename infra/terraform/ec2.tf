#resource "aws_network_interface" "interface" {
#  depends_on      = [module.vpc]
#  subnet_id       = element(module.vpc.public_subnets, 0)
#  private_ips     = [cidrhost(element(local.public_subnets, 0), 5)]
#  security_groups = [aws_security_group.jenkins.id]
#}

resource "aws_instance" "ec2" {
#  depends_on                  = [aws_network_interface.interface, module.eks]
  depends_on                  = [module.eks]
  ami                         = data.aws_ami.amazon-linux-2023.id
  instance_type               = local.instance_type
  associate_public_ip_address = true
  user_data                   = file("userdata.sh")
  key_name                    = aws_key_pair.deployer.key_name
  iam_instance_profile        = aws_iam_instance_profile.profile.name
  user_data_replace_on_change = true
  vpc_security_group_ids      = [aws_security_group.jenkins.id]
#  network_interface { # put EC2 instance in default VPC
#    network_interface_id = aws_network_interface.interface.id
#    device_index         = 0
#  }
  tags = {
    Name = "jenkins"
  }
}