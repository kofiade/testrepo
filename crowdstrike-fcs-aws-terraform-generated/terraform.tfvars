falcon_client_id                      = "a2d9b89bdce44fff8b98d7bfd0b1b328"
account_id                            = "600156956445"
primary_region                        = "us-east-1"
enable_realtime_visibility            = true
use_existing_cloudtrail               = true
enable_sensor_management              = true
enable_dspm                           = false
enable_vulnerability_scanning         = false
agentless_scanning_create_nat_gateway = true
agentless_scanning_regions            = ["us-east-1"]

resource_prefix              = "crowdstrike-"
log_ingestion_method          = "eventbridge"
log_ingestion_s3_bucket_name  = ""
log_ingestion_sns_topic_arn   = ""
log_ingestion_s3_bucket_prefix = ""
log_ingestion_kms_key_arn     = ""
