locals {
  instance_class      = var.environment == "prod" ? "db.t3.small" : "db.t3.micro"
  multi_az            = var.environment == "prod"
  deletion_protection = var.environment == "prod"
  skip_final_snapshot = var.environment != "prod"
}

resource "aws_db_instance" "this" {
  identifier     = "${var.db_name}-${var.environment}"
  engine         = var.engine
  engine_version = var.engine_version
  instance_class = local.instance_class

  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = var.db_name
  username = var.username
  password = var.password

  multi_az            = local.multi_az
  deletion_protection = local.deletion_protection
  skip_final_snapshot = local.skip_final_snapshot

  publicly_accessible = false

  tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
    Project     = "rds-automation"
  }
}
