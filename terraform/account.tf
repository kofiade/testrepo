
# Initializing providers for all regions
provider "aws" {
  region  = "ap-south-1"
  alias   = "ap_south_1"
}

provider "aws" {
  region  = "ca-central-1"
  alias   = "ca_central_1"
}

provider "aws" {
  region  = "eu-central-1"
  alias   = "eu_central_1"
}

provider "aws" {
  region  = "us-west-1"
  alias   = "us_west_1"
}

provider "aws" {
  region  = "us-west-2"
  alias   = "us_west_2"
}

provider "aws" {
  region  = "eu-north-1"
  alias   = "eu_north_1"
}

provider "aws" {
  region  = "eu-west-3"
  alias   = "eu_west_3"
}

provider "aws" {
  region  = "eu-west-2"
  alias   = "eu_west_2"
}

provider "aws" {
  region  = "eu-west-1"
  alias   = "eu_west_1"
}

provider "aws" {
  region  = "ap-northeast-3"
  alias   = "ap_northeast_3"
}

provider "aws" {
  region  = "ap-northeast-2"
  alias   = "ap_northeast_2"
}

provider "aws" {
  region  = "ap-northeast-1"
  alias   = "ap_northeast_1"
}

provider "aws" {
  region  = "sa-east-1"
  alias   = "sa_east_1"
}

provider "aws" {
  region  = "ap-southeast-1"
  alias   = "ap_southeast_1"
}

provider "aws" {
  region  = "ap-southeast-2"
  alias   = "ap_southeast_2"
}

provider "aws" {
  region  = "us-east-1"
  alias   = "us_east_1"
}

provider "aws" {
  region  = "us-east-2"
  alias   = "us_east_2"
}



module "fcs_account_ap_south_1" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "ap-south-1"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.ap_south_1
    crowdstrike = crowdstrike
  }
}

module "fcs_account_ca_central_1" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "ca-central-1"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.ca_central_1
    crowdstrike = crowdstrike
  }
}

module "fcs_account_eu_central_1" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "eu-central-1"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.eu_central_1
    crowdstrike = crowdstrike
  }
}

module "fcs_account_us_west_1" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "us-west-1"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.us_west_1
    crowdstrike = crowdstrike
  }
}

module "fcs_account_us_west_2" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "us-west-2"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.us_west_2
    crowdstrike = crowdstrike
  }
}

module "fcs_account_eu_north_1" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "eu-north-1"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.eu_north_1
    crowdstrike = crowdstrike
  }
}

module "fcs_account_eu_west_3" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "eu-west-3"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.eu_west_3
    crowdstrike = crowdstrike
  }
}

module "fcs_account_eu_west_2" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "eu-west-2"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.eu_west_2
    crowdstrike = crowdstrike
  }
}

module "fcs_account_eu_west_1" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "eu-west-1"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.eu_west_1
    crowdstrike = crowdstrike
  }
}

module "fcs_account_ap_northeast_3" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "ap-northeast-3"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.ap_northeast_3
    crowdstrike = crowdstrike
  }
}

module "fcs_account_ap_northeast_2" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "ap-northeast-2"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.ap_northeast_2
    crowdstrike = crowdstrike
  }
}

module "fcs_account_ap_northeast_1" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "ap-northeast-1"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.ap_northeast_1
    crowdstrike = crowdstrike
  }
}

module "fcs_account_sa_east_1" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "sa-east-1"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.sa_east_1
    crowdstrike = crowdstrike
  }
}

module "fcs_account_ap_southeast_1" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "ap-southeast-1"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.ap_southeast_1
    crowdstrike = crowdstrike
  }
}

module "fcs_account_ap_southeast_2" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "ap-southeast-2"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.ap_southeast_2
    crowdstrike = crowdstrike
  }
}

module "fcs_account_primary" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "us-east-1"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.us_east_1
    crowdstrike = crowdstrike
  }
}

module "fcs_account_us_east_2" {
  source                                      = "CrowdStrike/cloud-registration/aws"
  version                                     = "~>0.7.0"
  falcon_client_id                            = var.falcon_client_id
  falcon_client_secret                        = var.falcon_client_secret
  account_id                                  = var.account_id
  organization_id                             = var.organization_id
  permissions_boundary                        = var.permissions_boundary
  primary_region                              = var.primary_region
  enable_sensor_management                    = var.enable_sensor_management
  enable_realtime_visibility                  = var.enable_realtime_visibility && (contains(var.realtime_visibility_regions, "all") || contains(var.realtime_visibility_regions, "us-east-2"))
  use_existing_cloudtrail                     = var.use_existing_cloudtrail
  enable_dspm                                 = var.enable_dspm
  enable_vulnerability_scanning               = var.enable_vulnerability_scanning
  agentless_scanning_regions                  = var.agentless_scanning_regions
  agentless_scanning_create_nat_gateway       = var.agentless_scanning_create_nat_gateway
  dspm_s3_access                              = var.dspm_s3_access
  dspm_dynamodb_access                        = var.dspm_dynamodb_access
  dspm_rds_access                             = var.dspm_rds_access
  dspm_redshift_access                        = var.dspm_redshift_access
  dspm_ebs_access                             = var.dspm_ebs_access
  agentless_scanning_host_account_id          = var.agentless_scanning_host_account_id 
  agentless_scanning_host_role_name           = var.agentless_scanning_host_role_name 
  agentless_scanning_host_scanner_role_name   = var.agentless_scanning_host_scanner_role_name
  agentless_scanning_use_custom_vpc           = var.agentless_scanning_use_custom_vpc
  agentless_scanning_custom_vpc_resources_map = var.agentless_scanning_custom_vpc_resources_map

  use_existing_iam_reader_role                  = var.use_existing_iam_reader_role
  iam_role_name                                 = crowdstrike_cloud_aws_account.this.iam_role_name
  external_id                                   = crowdstrike_cloud_aws_account.this.external_id
  intermediate_role_arn                         = crowdstrike_cloud_aws_account.this.intermediate_role_arn
  eventbus_arn                                  = crowdstrike_cloud_aws_account.this.eventbus_arn
  agentless_scanning_role_name                  = crowdstrike_cloud_aws_account.this.agentless_scanning_role_name
  cloudtrail_bucket_name                        = crowdstrike_cloud_aws_account.this.cloudtrail_bucket_name
  agentless_scanning_integration_role_unique_id = module.fcs_account_primary.integration_role_unique_id
  agentless_scanning_scanner_role_unique_id     = module.fcs_account_primary.scanner_role_unique_id

  log_ingestion_s3_bucket_name    = var.log_ingestion_s3_bucket_name
  log_ingestion_sns_topic_arn     = var.log_ingestion_sns_topic_arn
  log_ingestion_s3_bucket_prefix  = var.log_ingestion_s3_bucket_prefix
  log_ingestion_kms_key_arn       = var.log_ingestion_kms_key_arn
  log_ingestion_method            = var.log_ingestion_method

  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
  tags            = var.tags

  providers = {
    aws         = aws.us_east_2
    crowdstrike = crowdstrike
  }
}

