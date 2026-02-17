variable "falcon_client_id" {
  type        = string
  description = "Falcon API Client ID"
  validation {
    condition     = length(var.falcon_client_id) == 32 && can(regex("^[a-fA-F0-9]+$", var.falcon_client_id))
    error_message = "falcon_client_id must be a 32-character hexadecimal string. Please use the Falcon console to generate a new API key/secret pair with appropriate scopes."
  }
}
variable "falcon_client_secret" {
  type        = string
  sensitive   = true
  description = "Falcon API Client Secret"
  validation {
    condition     = length(var.falcon_client_secret) == 40 && can(regex("^[a-zA-Z0-9]+$", var.falcon_client_secret))
    error_message = "falcon_client_secret must be a 40-character hexadecimal string. Please use the Falcon console to generate a new API key/secret pair with appropriate scopes."
  }
}
variable "account_id" {
  type        = string
  default     = ""
  description = "The AWS 12 digit account ID"
  validation {
    condition     = can(regex("^[0-9]{12}$", var.account_id))
    error_message = "account_id must be either empty or the 12-digit AWS account ID"
  }
}

variable "primary_region" {
  type        = string
  description = "AWS region to be used when creating resources"
}
variable "custom_role_name" {
  type        = string
  default     = ""
  description = "Custom role name for Asset Inventory integration"
}
variable "use_existing_iam_reader_role" {
  type        = bool
  default     = false
  description = "Set to true if you want to use an existing IAM role for asset inventory"
}
variable "permissions_boundary" {
  type        = string
  default     = ""
  description = "The name of the policy used to set the permissions boundary for IAM roles"
}
variable "organization_id" {
  type        = string
  default     = ""
  description = "The AWS Organization ID. Leave blank if when onboarding single account"
}
variable "organizational_unit_ids" {
  type        = list(string)
  default     = []
  description = "The Organizational Unit IDs. Leave blank when deploying to root OU"
}
variable "enable_realtime_visibility" {
  type        = bool
  default     = false
  description = "Set to true to enable behavior assessment"
}
variable "use_existing_cloudtrail" {
  type        = bool
  default     = false
  description = "Set to true if you already have a cloudtrail"
}
variable "realtime_visibility_regions" {
  type        = list(string)
  default     = ["all"]
  description = <<EOF
    The list of regions where Real-time visibility and detection should be enabled. Use ["all"] to onboard all regions
  EOF
}
variable "enable_sensor_management" {
  type        = bool
  description = "Set to true to enable 1click Sensor Management feature"
}
variable "enable_dspm" {
  type        = bool
  default     = false
  description = "Set to true to enable Data Security Posture Managment"
}
variable "enable_vulnerability_scanning" {
  type        = bool
  default     = false
  description = "Set to true to enable Vulnerability Scanning"
}
variable "agentless_scanning_regions" {
  type        = list(string)
  default     = [""]
  description = "List of regions where agentless scanning will be deployed"
}
variable "agentless_scanning_create_nat_gateway" {
  type        = bool
  default     = true
  description = "Set to true to create a NAT Gateway for agentless scanning environments"
}
variable "dspm_s3_access" {
  description = "Apply permissions for S3 bucket scanning"
  type        = bool
  default     = true
}
  variable "dspm_dynamodb_access" {
  description = "Apply permissions for DynamoDB table scanning"
  type        = bool
  default     = true
}
  variable "dspm_rds_access" {
  description = "Apply permissions for RDS instance scanning"
  type        = bool
  default     = true
}    
  variable "dspm_redshift_access" {
  description = "Apply permissions for Redshift cluster scanning"
  type        = bool
  default     = true
}
  variable "dspm_ebs_access" {
  description = "Apply permissions for DSPM VM scanning"
  type        = bool
  default     = true
}
variable "agentless_scanning_host_account_id" {
  type        = string
  default     = ""
  description = "The AWS account ID where agentless scanning host resources are deployed"
} 
variable "agentless_scanning_host_role_name" {
  type        = string
  default     = "CrowdStrikeAgentlessScanningIntegrationRole"
  description = "Name of agentless scanning integration role in host account"
}
variable "agentless_scanning_host_scanner_role_name" {
  type        = string
  default     = "CrowdStrikeAgentlessScanningScannerRole"
  description = "Name of agentless scanning scanner role in host account"
}
variable "agentless_scanning_use_custom_vpc" {
  description = "Use existing custom VPC resources for ALL deployment regions (requires agentless_scanning_custom_vpc_resources_map with all regions)"
  type        = bool
  default     = false
}
variable "agentless_scanning_custom_vpc_resources_map" {
  description = "Map of region-specific VPC resources for existing VPC deployment. Keys are region names, values are objects containing VPC resource IDs."
  type = map(object({
    vpc            = string
    scanner_subnet = string
    scanner_sg     = string
    db_subnet_a    = string
    db_subnet_b    = string
    db_sg          = string
  }))
  default = {}
}
variable "resource_prefix" {
  description = "The prefix to be added to all resource names"
  default     = "CrowdStrike"
  type        = string
}
variable "resource_suffix" {
  description = "The suffix to be added to all resource names"
  default     = ""
  type        = string
}
variable "tags" {
  description = "A map of tags to add to all resources that support tagging"
  type        = map(string)
  default     = {}
}
variable "log_ingestion_method" {
  type        = string
  default     = "eventbridge"
  description = "Choose the method for ingesting CloudTrail logs - EventBridge (default) or S3"
}

variable "log_ingestion_s3_bucket_name" {
  type        = string
  default     = ""
  description = "S3 bucket name containing CloudTrail logs (required when log_ingestion_method=s3)"
}

variable "log_ingestion_sns_topic_arn" {
  type        = string
  default     = ""
  description = "SNS topic ARN that publishes S3 object creation events (required when log_ingestion_method=s3)"
}

variable "log_ingestion_s3_bucket_prefix" {
  type        = string
  default     = ""
  description = "Optional S3 bucket prefix/path for CloudTrail logs (when log_ingestion_method=s3)"
}

variable "log_ingestion_kms_key_arn" {
  type        = string
  default     = ""
  description = "Optional KMS key ARN for decrypting S3 objects (when log_ingestion_method=s3)"
}

variable "external_id" {
  type        = string
  default     = ""
  description = "External ID for secure cross-account role assumption"
}

variable "intermediate_role_arn" {
  type        = string
  default     = ""
  description = "CrowdStrike Role ARN for cross-account access"
}
