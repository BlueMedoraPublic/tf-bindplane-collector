// example usage  //

// Vault is used to retrieve secrets
// Note that secrets will be stored in your state file
//
data "vault_generic_secret" "api_key" {
  path = "secret/bindplane/reference"
}

data "vault_generic_secret" "azure_account" {
  path = "secret/azure/account"
}

// GCP collector depends on gcloud SDK being installed and
// authenticated
//
module "gcp_collector" {
  source = "git::git@github.com:BlueMedoraPublic/tf-bindplane-collector.git//gcp_collector?ref=v0.1.1"

  // required parameters //
  project           = "vrops-demo"
  bindplane_secret_key = "${data.vault_generic_secret.api_key.data["api_key"]}"
  collector_name    = "gcp-poc"
  network_zone      = "us-west1-a"
}

// Azure collector depends on azure cli being installed and
// authenticated
//
module "azure_collector" {
  source = "git::git@github.com:BlueMedoraPublic/tf-bindplane-collector.git//azure_collector?ref=v0.1.1"

  // required parameters //
  resource_group    = "collector-testing"
  bindplane_secret_key = "${data.vault_generic_secret.api_key.data["api_key"]}"
  collector_name    = "azure-poc"
  subnet_id         = "/subscriptions/${data.vault_generic_secret.azure_account.data["subscription_id"]}/resourceGroups/collector-testing/providers/Microsoft.Network/virtualNetworks/collector-testing-network/subnets/collector-testing-subnet-0"
  admin_username    = "medora"
}
