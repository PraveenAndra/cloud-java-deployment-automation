# Network Vars
region              = "us-east-2"
vpc_id              = "vpc-0eaa7a619670a1d8c"
subnet_ids          = ["subnet-072cf29d9dd6aa221", "subnet-0af9eedf7fdbebe3a", "subnet-0fbffa7b08499db30"]
multi_az            = false
publicly_accessible = true

# DB Vars
db_engine                   = "mysql"
db_storage_type             = "gp2"
db_username                 = "projectdb"
db_instance_class           = "db.t3.micro"
db_storage_size             = 20
set_secret_manager_password = true
set_db_password             = false
db_password                 = "Pra@24040505"

# Security Group Vars
ingress_from_port   = 3306
ingress_to_port     = 3306
ingress_protocol    = "tcp"
ingress_cidr_blocks = ["0.0.0.0/0"]

egress_from_port   = 0
egress_to_port     = 0
egress_protocol    = "-1"
egress_cidr_blocks = ["0.0.0.0/0"]

# Backup vars
backup_retention_period  = 7
delete_automated_backups = true
copy_tags_to_snapshot    = true
skip_final_snapshot      = true
apply_immediately        = true

# Parameter store
parameter_store_secret_name = "/dev/petclinic/rds_endpoint"
type                        = "String"

# Tag Vars
owner       = "praveen"
environment = "dev"
cost_center = "project-autodeploy-cost"
application = "pet-clinic"