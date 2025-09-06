#Create a vpc for terrform-jenkins-lab
resource "aws_vpc" "jenkins-terraform-dev-vpc" {
 cidr_block = var.vpc_dev_cidr

 tags = {
  Name = var.name_project
 }
}

resource "aws_subnet" "jenkins-terraform-dev-subnet1" {
    vpc_id = aws_vpc.jenkins-terraform-dev-vpc.id
    cidr_block = var.vpc_dev_subnet_cidr[0]
    availability_zone = var.vpc_dev_subnet_az[0]
    map_public_ip_on_launch = "true"

    tags = {
      Name = "terraform-jenkins-dev-public-subnet1-az1"
    }
  
}

resource "aws_subnet" "jenkins-terraform-dev-subnet2" {
    vpc_id = aws_vpc.jenkins-terraform-dev-vpc.id
    cidr_block = var.vpc_dev_subnet_cidr[1]
    availability_zone = var.vpc_dev_subnet_az[1]
    map_public_ip_on_launch = "true"

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

#create internet gateway in vpc
resource "aws_internet_gateway" "jenkins-terraform-dev-igw" {
  vpc_id = aws_vpc.jenkins-terraform-dev-vpc.id

  tags = {
    Name = "terraform-jenkins-dev-igw"
  }
}

#create a route tables for public subnet
resource "aws_route_table" "jenkins-terraform-dev-public-rt" {
  vpc_id = aws_vpc.jenkins-terraform-dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins-terraform-dev-igw.id
  }
  tags = {
    Name = "jekins-terrform-dev-public-rt"
  }
}

# create a private route table for management vpc 
resource "aws_route_table" "jenkins-terraform-dev-private-rt" {
  vpc_id = aws_vpc.jenkins-terraform-dev-vpc.id
  tags = {
    Name = "jenkins-terraform-dev-private-rt"
  }
}

# crate a subnet assosiation for public rt
resource "aws_route_table_association" "publicrtsubnet1assosiation" {
  subnet_id      = aws_subnet.jenkins-terraform-dev-subnet1.id
  route_table_id = aws_route_table.jenkins-terraform-dev-public-rt.id
}

resource "aws_route_table_association" "publicrtsubnet2assosiation" {
  subnet_id      = aws_subnet.jenkins-terraform-dev-subnet2.id
  route_table_id = aws_route_table.jenkins-terraform-dev-public-rt.id
}


# crate a subnet assosiation for private rt
resource "aws_route_table_association" "privatesubnet3assosiation" {
  subnet_id      = aws_subnet.jenkins-terraform-dev-subnet3.id
  route_table_id = aws_route_table.jenkins-terraform-dev-private-rt.id
}

resource "aws_route_table_association" "privatesubnet4assosiation" {
  subnet_id      = aws_subnet.jenkins-terraform-dev-subnet4.id
  route_table_id = aws_route_table.jenkins-terraform-dev-private-rt.id
}
