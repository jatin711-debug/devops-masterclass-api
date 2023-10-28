resource "aws_vpc" "vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "${var.vpc_name}"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "${var.vpc_name}-igw"
    }
}

data "aws_availability_zones" "available" {
    state = "available"
}

resource "aws_subnet" "subnet_1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.subnet_cidr_1
    availability_zone = data.aws_availability_zones.available.names[0]
    tags = {
        Name = "${var.vpc_name}-subnet"
    }
}

resource "aws_subnet" "subnet_2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.subnet_cidr_2
    availability_zone = data.aws_availability_zones.available.names[1]
    tags = {
        Name = "${var.vpc_name}-subnet"
    }
}

resource "aws_subnet" "subnet_3" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.subnet_cidr_3
    availability_zone = data.aws_availability_zones.available.names[2]
    tags = {
        Name = "${var.vpc_name}-subnet"
    }   
}

resource "aws_route_table" "route_table" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "route_table_association_1" {
    subnet_id = aws_subnet.subnet_1.id
    route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "route_table_association_2" {
    subnet_id = aws_subnet.subnet_2.id
    route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "route_table_association_3" {
    subnet_id = aws_subnet.subnet_3.id
    route_table_id = aws_route_table.route_table.id
}
