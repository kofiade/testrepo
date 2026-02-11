# terraform/vulnerable-rds.tf
# INTENTIONALLY VULNERABLE - FOR TESTING ONLY

# Critical: RDS instance publicly accessible without encryption
resource "aws_db_instance" "vulnerable_db" {
  identifier        = "vulnerable-database"
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t2.micro"
  allocated_storage = 20

  username = "admin"
  password = "SuperSecretPassword123!"  # CRITICAL: Hardcoded password

  publicly_accessible    = true   # CRITICAL: Database exposed to internet
  storage_encrypted      = false  # CRITICAL: No encryption at rest
  skip_final_snapshot    = true

  # Missing: No deletion protection
  deletion_protection = false
}

# Critical: RDS without backup retention
resource "aws_db_instance" "no_backup_db" {
  identifier        = "no-backup-database"
  engine            = "postgres"
  instance_class    = "db.t2.micro"
  allocated_storage = 20

  username = "admin"
  password = "AnotherHardcodedPass!"  # CRITICAL: Hardcoded password

  backup_retention_period = 0  # CRITICAL: No backups
}
