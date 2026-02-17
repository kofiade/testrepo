terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.45"
    }
    crowdstrike = {
      source = "crowdstrike/crowdstrike"
      version = ">= 0.0.58" 
    }
  }
}

provider "crowdstrike" {
  client_id     = var.falcon_client_id
  client_secret = var.falcon_client_secret
}

# Provision AWS account in Falcon.
resource "crowdstrike_cloud_aws_account" "this" {
  account_id                         = var.account_id
  organization_id                    = var.organization_id
  target_ous                         = var.organizational_unit_ids
  resource_name_prefix               = var.resource_prefix
  resource_name_suffix               = var.resource_suffix

  asset_inventory = {
    enabled   = true
    role_name = var.custom_role_name
  }

  realtime_visibility = {
    enabled                 = var.enable_realtime_visibility
    cloudtrail_region       = var.primary_region
    use_existing_cloudtrail = var.use_existing_cloudtrail
    regions                 = var.realtime_visibility_regions
    log_ingestion_s3_bucket_name       = var.log_ingestion_s3_bucket_name == "" ? null : var.log_ingestion_s3_bucket_name
    log_ingestion_sns_topic_arn        = var.log_ingestion_sns_topic_arn == "" ? null : var.log_ingestion_sns_topic_arn
    log_ingestion_s3_bucket_prefix     = var.log_ingestion_s3_bucket_prefix == "" ? null : var.log_ingestion_s3_bucket_prefix
    log_ingestion_kms_key_arn          = var.log_ingestion_kms_key_arn == "" ? null : var.log_ingestion_kms_key_arn
    log_ingestion_method               = var.log_ingestion_method == "" ? null : var.log_ingestion_method
  }

  idp = {
    enabled = var.enable_realtime_visibility
  }

  sensor_management = {
    enabled = var.enable_sensor_management
  }

  dspm = {
    enabled   = var.enable_dspm
  }

  vulnerability_scanning = {
    enabled = var.enable_vulnerability_scanning
  }
  provider = crowdstrike
}
# Validate AWS account and trigger health check scan
data "crowdstrike_cloud_aws_account_validation" "fcs_account_validation" {
  account_id      = crowdstrike_cloud_aws_account.this.organization_id == "" ? crowdstrike_cloud_aws_account.this.account_id : null
  organization_id = crowdstrike_cloud_aws_account.this.organization_id == "" ? null : crowdstrike_cloud_aws_account.this.organization_id

  depends_on = [
    module.fcs_account_ap_south_1,

    module.fcs_account_ca_central_1,

    module.fcs_account_eu_central_1,

    module.fcs_account_us_west_1,

    module.fcs_account_us_west_2,

    module.fcs_account_eu_north_1,

    module.fcs_account_eu_west_3,

    module.fcs_account_eu_west_2,

    module.fcs_account_eu_west_1,

    module.fcs_account_ap_northeast_3,

    module.fcs_account_ap_northeast_2,

    module.fcs_account_ap_northeast_1,

    module.fcs_account_sa_east_1,

    module.fcs_account_ap_southeast_1,

    module.fcs_account_ap_southeast_2,

    module.fcs_account_primary,

    module.fcs_account_us_east_2,


  ]
}
