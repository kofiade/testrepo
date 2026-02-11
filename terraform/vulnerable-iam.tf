# terraform/vulnerable-iam.tf
# INTENTIONALLY VULNERABLE - FOR TESTING ONLY

# Critical: IAM policy with admin access
resource "aws_iam_policy" "overly_permissive" {
  name        = "overly-permissive-policy"
  description = "Vulnerable IAM policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "*"           # CRITICAL: Allows all actions
        Resource = "*"           # CRITICAL: On all resources
      }
    ]
  })
}

# Critical: IAM role with assume role from anywhere
resource "aws_iam_role" "vulnerable_role" {
  name = "vulnerable-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"          # CRITICAL: Anyone can assume this role
        Action    = "sts:AssumeRole"
      }
    ]
  })
}
