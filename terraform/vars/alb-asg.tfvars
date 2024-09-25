#Network
region  = "us-east-2"
vpc_id  = "vpc-0eaa7a619670a1d8c"
subnets = ["subnet-072cf29d9dd6aa221", "subnet-0af9eedf7fdbebe3a", "subnet-0fbffa7b08499db30"]

#alb_sg
ingress_alb_from_port   = 80
ingress_alb_to_port     = 80
ingress_alb_protocol    = "tcp"
ingress_alb_cidr_blocks = ["0.0.0.0/0"] # Allows inbound HTTP traffic on port 80 from the internet
egress_alb_from_port    = 0
egress_alb_to_port      = 0
egress_alb_protocol     = "-1"
egress_alb_cidr_blocks  = ["0.0.0.0/0"]

#alb
internal          = false
loadbalancer_type = "application"

#target_group (Target Group for EC2 instances)
target_group_port                = 8080
target_group_protocol            = "HTTP"
target_type                      = "instance"
load_balancing_algorithm         = "round_robin"
health_check_path                = "/" # Path used for health checks
health_check_port                = 8080
health_check_protocol            = "HTTP"
health_check_interval            = 30
health_check_timeout             = 5
health_check_healthy_threshold   = 2
health_check_unhealthy_threshold = 2

#instance_sg (Security Group for EC2 instances)
ingress_asg_cidr_from_port = 22
ingress_asg_cidr_to_port   = 22
ingress_asg_cidr_protocol  = "tcp"
ingress_asg_cidr_blocks    = ["0.0.0.0/0"]
ingress_asg_sg_from_port   = 8080 # java Application Port
ingress_asg_sg_to_port     = 8080
ingress_asg_sg_protocol    = "tcp"
egress_asg_from_port       = 0
egress_asg_to_port         = 0
egress_asg_protocol        = "-1"
egress_asg_cidr_blocks     = ["0.0.0.0/0"]

#asg  (Auto Scaling Group)
max_size         = 3  # Maximum number of instances in the ASG
min_size         = 1
desired_capacity = 2  # Desired number of instances running at any time

#listener (ALB listener for HTTP traffic)
listener_port     = 80 # ALB listens on port 80 for HTTP traffic
listener_protocol = "HTTP"
listener_type     = "forward"

#launch_template  (EC2 instance launch template)
ami_id               = "ami-0f7a74cccd5a223bc"
instance_type        = "t2.medium"  # EC2 instance type for Java application
key_name             = "project-autodeploy"  # SSH key pair name
user_data            = <<-EOF
#!/bin/bash
bash /home/ubuntu/start.sh
EOF
public_access        = true
instance_warmup_time = 30
target_value         = 50

owner       = "praveen"
environment = "dev"
cost_center = "project-autodeploy-cost"
application = "pet-clinic"