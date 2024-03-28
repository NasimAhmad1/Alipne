variable "image_name" {
    default = "ami-033a1ebf088e56e81"
  
}

variable "instance_type" {
    type = string
    default = "t2.micro"
  
}

variable "PATH_TO_KEY" {
    type = string
    default = "id_rsa.pub"
  
}
