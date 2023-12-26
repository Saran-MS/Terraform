data "aws_ami_ids" "amazon_linux" {
  owners = ["amazon"]
  
  filter {
    name   = "description"
    values = ["Amazon Linux * AMI * x86_64 HVM kernel-6.1"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "server" {
  ami = data.aws_ami_ids.amazon_linux.ids[0]
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet["public-subnet"].id
  key_name = var.key
  tags={
    Name="ec2-${var.instance_type}"
  }
  depends_on = [ aws_subnet.subnet ]
}