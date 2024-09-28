variable "ami_id" {
  type    = string
  default = "ami-003932de22c285676"
}

locals {
    app_name = "java-app"
}

packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}


source "amazon-ebs" "java-app" {
  ami_name      = "PACKER-${local.app_name}"
  instance_type = "t2.medium"
  region        = "us-east-2"
  source_ami    = "${var.ami_id}"
  ssh_username  = "ubuntu"
  tags = {
    Env  = "Dev"
    Name = "PACKER-${local.app_name}"
  }
}

build {
  sources = ["source.amazon-ebs.java-app"]

   provisioner "shell-local" {
   inline = [
       "wsl ansible-playbook -i 'localhost,' -c local /mnt/e/GitHub/cloud-java-deployment-automation/ansible/java-app.yml"
    ]
    }
  

}
