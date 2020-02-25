provider "aws" {
  region = "ap-southeast-1"
}

data "aws_ami" "amazon-linux-2" {
 most_recent = true


 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }


 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
 owners = ["137112412989"] # Amazon Linux
}

resource "aws_security_group" "app-sg" {
  name            = "app-sg"
  vpc_id          = "vpc-8fb9bbe8"
  
  ingress {
    protocol    = "tcp" 
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    protocol    = "tcp" 
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
 tags = {
    Name = "app-sg"
  }
}


resource "aws_instance" "web" {
  ami           = "data.aws_ami.amazon-linux-2.id"
  instance_type = "t2.micro"
  key_name      = "devops-eks-wn"
  vpc_security_group_ids  = ["aws_security_group.app-sg.id"]
  tags = {
    Name = "devsecops"

  }
  
}
