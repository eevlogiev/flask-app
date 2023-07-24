resource "aws_security_group" "jenkins" {
  name        = "${local.name}-allow-jenkins"
  description = "Allow Jenkins inbound traffic"
  # vpc_id      = module.vpc.vpc_id #Jenkins moved to default VPC
  ingress {
    description = "Jenkins Web access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [local.source_ip]
  }
  ingress {
    description = "Allow Flask"
    from_port   = 30000
    to_port     = 30000
    protocol    = "tcp"
    cidr_blocks = [local.source_ip]
  }
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [local.source_ip]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [local.source_ip]
    ipv6_cidr_blocks = ["::/0"]
  }
}