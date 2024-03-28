resource "aws_key_pair" "my-key" {
    key_name = "my-key"
    public_key = file( var.PATH_TO_KEY)
  
}

resource "aws_security_group" "mysg" {
    name = "customsg"
    description = "Allow SSH"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}

resource "aws_instance" "k8" {
    ami = var.image_name
    key_name = aws_key_pair.my-key.key_name
    instance_type = var.instance_type
    vpc_security_group_ids = ["${aws_security_group.mysg.id}"]

    tags = {
      Name = "kubernet"
    }
  
}

output "public_IP" {
  value = aws_instance.k8.public_ip
}
