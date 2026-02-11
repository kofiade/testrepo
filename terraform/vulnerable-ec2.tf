# terraform/vulnerable-ec2.tf
# INTENTIONALLY VULNERABLE - FOR TESTING ONLY

# Critical: Security group with unrestricted ingress
resource "aws_security_group" "allow_all" {
  name        = "allow_all_traffic"
  description = "Vulnerable security group"

  # CRITICAL: Allow all inbound traffic from anywhere
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # CRITICAL: Open to the world
  }

  # CRITICAL: Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Critical: SSH open to the world
resource "aws_security_group" "ssh_open" {
  name        = "ssh_open_to_world"
  description = "SSH open to everyone"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # CRITICAL: SSH from anywhere
  }
}

# Critical: RDP open to the world
resource "aws_security_group" "rdp_open" {
  name        = "rdp_open_to_world"
  description = "RDP open to everyone"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # CRITICAL: RDP from anywhere
  }
}

# Critical: EC2 instance without encryption
resource "aws_instance" "vulnerable_instance" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  # Missing: No encryption for root volume - CRITICAL
  root_block_device {
    encrypted = false  # CRITICAL: Unencrypted root volume
  }

  # Missing: No IMDSv2 requirement - CRITICAL
  metadata_options {
    http_tokens = "optional"  # CRITICAL: IMDSv1 allowed
  }
}
