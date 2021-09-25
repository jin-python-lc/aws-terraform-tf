#Region
aws_region = "ap-northeast-1"

#IDs
VPCid = "vpc-08ac5c963a79d4a80"
IGWid = "igw-0b43fecabc1b03515"

#Igw
igwName = "TerraFormDemoIGW-variable"

#PublicSubnet
map_public_ip_on_launch = "true"
PUBSUBcidr_block = "10.0.3.0/24"
PUBSUBaz = "ap-northeast-1a"
PUBSUBName = "TerraFormDemo-Subnet-1-variable"

#PrivateSubnet
PRISUBcidr_block = "10.0.4.0/24"
PRISUBaz = "ap-northeast-1a"
PRISUBName = "TerraFormDemo-Subnet-2-Private-variable"

#RouteTable
rtName = "TFRouteTable-variable"

#EC2
ami           = "ami-09ebacdc178ae23b7"
instance_type = "t2.micro"
instanceName = "TerraFormDemoInstance-variable"