#Create a vpc for terrform-jenkins-lab
resource "aes_vpc" "jenkins-terraform-dev" {
 vpc_cidr = var.vpc_dev_cidr

 tags = {
  Name = var.name_project
 }
}

resource "aws_subnet" "jenkins-terraform-dev-subnet1" {
    vpc_id = aws_vpc.jenkins-terraform-dev-vpc.id
    cidr_block = var.vpc_dev_subnet_cidr[0]
    availability_zone = var.vpc_dev_subnet_az[0]

    tags = {
      Name = "terraform-jenkins-dev-public-subnet1-az1"
    }
  
}

resource "aws_subnet" "jenkins-terraform-dev-subnet2" {
    vpc_id = aws_vpc.jenkins-terraform-dev-vpc.id
    cidr_block = var.vpc_dev_subnet_cidr[1]
    availability_zone = var.vpc_dev_subnet_az[1]

    tags = {
      Name = "terraform-jenkins-dev-public-subnet2-az2"
    }
  
}

resource "aws_subnet" "jenkins-terraform-dev-subnet3" {
    vpc_id = aws_vpc.jenkins-terraform-dev-vpc.id
    cidr_block = var.vpc_dev_subnet_cidr[2]
    availability_zone = var.vpc_dev_subnet_az[0]

    tags = {
      Name = "terraform-jenkins-dev-public-subnet1-az3"
    } 
}

resource "aws_subnet" "jenkins-terraform-dev-subnet4" {
    vpc_id = aws_vpc.jenkins-terraform-dev-vpc.id
    cidr_block = var.vpc_dev_subnet_cidr[3]
    availability_zone = var.vpc_dev_subnet_az[1]

    tags = {
      Name = "terraform-jenkins-dev-public-subnet2-az1"
    }
  
}