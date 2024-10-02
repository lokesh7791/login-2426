# VPC Resource
resource "aws_vpc" "lms-vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
        Name = "lms-vpc"
    }
}
resource "aws_subnet" "login-fe-sn" {
    vpc_id = "aws_vpc.lms-vpc.id"
    cidr_block = "10.0.1.0/25"
    availability_zone = "us-east-la"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "login-frontend-subnet"
    }
}
resource "aws_subnet" "login-be-sn" {
    vpc_id = "aws_vpc.lms-vpc.id"
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1c"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "login-backend-subnet"
    }
}
resource "aws_subnet" "login_db_sn" {
    vpc_id = "aws_vpc.lms-vpc.id"
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = "false"
    tags = {
        Name = "login-database-subnet"
    }
}
resource "aws_internet_gateway" "login-igw" {
    vpc-id = "aws_vpc.lms-vpc.id"
    tags = {
        Name = "login-IGW"
    }
}