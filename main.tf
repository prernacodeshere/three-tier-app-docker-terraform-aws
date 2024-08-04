resource "aws_instance" "three_tier_vm" {
  ami           = var.ami_id 
  instance_type = var.instance_type             
  key_name      = "efskey" 

  root_block_device {
    volume_size = var.volume_size 
  }                 

  tags = {
    Name = "Three-Tier-Demo-VM"
  }

  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  user_data = base64encode(file("userdata.sh"))

  

  }



resource "aws_security_group" "instance_sg" {
  name        = "three_tier_sg"
  description = "Allow SSH, HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "instance_public_ip" {
  value = aws_instance.three_tier_vm.public_ip
}

  
