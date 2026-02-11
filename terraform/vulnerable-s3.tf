# terraform/vulnerable-s3.tf
# INTENTIONALLY VULNERABLE - FOR TESTING ONLY

# Critical: S3 bucket with public access
resource "aws_s3_bucket" "vulnerable_bucket" {
  bucket = "my-vulnerable-bucket"
  acl    = "public-read-write"  # CRITICAL: Public read-write access

  tags = {
    Name        = "Vulnerable Test Bucket"
    Environment = "test"
  }
}

# Critical: No encryption enabled
resource "aws_s3_bucket" "unencrypted_bucket" {
  bucket = "my-unencrypted-bucket"
  
  # Missing server-side encryption configuration - CRITICAL
}

# Critical: No versioning enabled
resource "aws_s3_bucket_versioning" "disabled" {
  bucket = aws_s3_bucket.vulnerable_bucket.id
  versioning_configuration {
    status = "Disabled"  # CRITICAL: Versioning disabled
  }
}
