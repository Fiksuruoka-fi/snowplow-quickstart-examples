# Please accept the terms of the Snowplow Limited Use License Agreement to proceed. (https://docs.snowplow.io/limited-use-license-1.0/)
accept_limited_use_license = true

# Will be prefixed to all resource names
# Use this to easily identify the resources created and provide entropy for subsequent environments
prefix = "sp"

# The project to deploy the infrastructure into
project_id = "snowplow-test-447809"

# Where to deploy the infrastructure
region = "europe-west1"

# Update to the network you would like to deploy into
#
# Note: If you opt to use your own network then you will need to define a subnetwork to deploy into as well
network    = "default"
subnetwork = ""

# Update this to your IP Address
ssh_ip_allowlist = ["0.0.0.0/0"]
# Generate a new SSH key locally with `ssh-keygen`
# ssh-keygen -t rsa -b 4096 
ssh_key_pairs = [
  {
    user_name  = "snowplow"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQA0jSi9//bRsHW4M6czodTs6smCXsxZ0gijzth0aBmycE= snowplow@Snowplows-MacBook-Pro.local"
  }
]

# Iglu Server DNS output from the Iglu Server stack
iglu_server_dns_name = "http://<CHANGE-TO-MY-IGLU-IP>"
# Used for API actions on the Iglu Server
# Change this to the same UUID from when you created the Iglu Server
iglu_super_api_key = "798cc48d-52f3-48fe-a5ce-5a7a280347bf"

# Collector SSL Configuration (optional)
ssl_information = {
  certificate_id = ""
  enabled        = false
}

# --- TARGETS CONFIGURATION ZONE --- #

# --- Target: PostgreSQL
postgres_db_enabled = false

postgres_db_name     = "snowplow"
postgres_db_username = "snowplow"
# Change and keep this secret!
postgres_db_password = "fiksutesti"
# IP ranges that you want to query the Pipeline Postgres Cloud SQL instance from directly over the internet.  An alternative access method is to leverage
# the Cloud SQL Proxy service which creates an IAM authenticated tunnel to the instance
#
# Details: https://cloud.google.com/sql/docs/postgres/sql-proxy
#
# Note: this exposes your data to the internet - take care to ensure your allowlist is strict enough
postgres_db_authorized_networks = [
  {
    name  = "kasperi"
    value = "2001:4860:7:60e::ff/32"
  },
]
# Note: the size of the database instance determines the number of concurrent connections - each Postgres Loader instance creates 10 open connections so having
# a sufficiently powerful database tier is important to not running out of connection slots
postgres_db_tier = "db-g1-small"

# --- Target: BigQuery
bigquery_db_enabled = true

# To use an existing bucket set this to false
bigquery_loader_dead_letter_bucket_deploy = true
# Must be globally unique so will need to be updated before applying
bigquery_loader_dead_letter_bucket_name = "sp-bq-loader-dead-letter"

# --- ADVANCED CONFIGURATION ZONE --- #

# See for more information: https://registry.terraform.io/modules/snowplow-devops/collector-pubsub-ce/google/latest#telemetry
# Telemetry principles: https://docs.snowplowanalytics.com/docs/open-source-quick-start/what-is-the-quick-start-for-open-source/telemetry-principles/
user_provided_id  = ""
telemetry_enabled = true

# --- Extra Labels to append to created resources (optional)
labels = {}
