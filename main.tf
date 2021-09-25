terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  #region  = "ap-northeast-1"
  region = var.aws_region
}




resource "aws_subnet" "TerraFormDemo-1" {
  vpc_id = var.VPCid
  map_public_ip_on_launch = var.map_public_ip_on_launch
  cidr_block = var.PUBSUBcidr_block
  availability_zone = var.PUBSUBaz

  tags = {
    Name = var.PUBSUBName
  }
}
resource "aws_subnet" "TerraFormDemo-2-Private" {
  vpc_id = var.VPCid
  cidr_block = var.PRISUBcidr_block
  availability_zone = var.PRISUBaz

  tags = {
    Name = var.PRISUBName
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = var.VPCid

  tags = {
    Name = var.rtName
  }
}
resource "aws_route" "public" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.public_rt.id
  gateway_id             = var.IGWid
}
resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.TerraFormDemo-1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_instance" "app_server" {
  subnet_id = aws_subnet.TerraFormDemo-1.id
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.instanceName
  }
}
