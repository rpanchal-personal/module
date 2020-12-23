variable "vpcid" {
  type = "string"
  default = "vpc-54c5e12e"
}

resource "aws_security_group" "terraform_ec2_sg" {
  name        = "terraform_ec2_sg"
  description = "Allow all inbound traffic"
  vpc_id      = "${var.vpcid}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

variable "amiid" {
  default = "ami-04d29b6f966df1537"
}

resource "aws_instance" "terraform_ec2_instance" {
  ami           = "${var.amiid}"
  instance_type = "t2.micro"
  key_name ="panchal"
  vpc_security_group_ids = ["${aws_security_group.terraform_ec2_sg.id}"]
  tags = {
    Name = "HelloWorld"
  }
}