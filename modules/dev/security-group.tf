# create security group for public servers
resource "aws_security_group" "jenkins-terraform-dev-sg" {
  name        = "jenkins-terraform-dev-sg"
  description = "Security Group for public servers jenkins-terraform-dev-sg "
  vpc_id = aws_vpc.jenkins-terraform-dev-vpc.id

    ingress {
      description = "Allow port ssh"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      description = "Allow port http"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  egress {
    description = "Allow ALL ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
