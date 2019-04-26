# tf-bindplane-collector
Terraform modules for deploying a Bindplane collector to AWS, GCP, Azure

## Example Usage

See main.tf for real examples. These modules are designed to deploy a collector
compute instance to existing infrastructure. All project, VPC, and networking
requirements should be pre-configured or programmatically deployed with
separate Terraform modules.

Example GCP:
```
terraform init
terraform apply -target module.gcp_collector
```

Cleanup:
```
terraform destroy
```

### AWS

< not implemented yet >

### Google Cloud
The following code will deploy a single collector to GCP:
```
module "gcp_collector" {
  source = "git::git@github.com:BlueMedoraPublic/tf-bindplane-collector.git//gcp_collector?ref=v0.1.0"

  project           = "vrops-demo"
  bindplane_api_key = "abcdefghijklmnop"
  collector_name    = "gcp-c-0"
  network_zone      = "us-west1-a"
}
```

### Azure
The following code will deploy a single collector to Azure.
Note, you need to specify your `subnet_id`:
```
module "azure_collector" {
  source = "git::git@github.com:BlueMedoraPublic/tf-bindplane-collector.git//azure_collector?ref=v0.1.0"

  resource_group    = "collector-testing"
  bindplane_api_key = "abcdefghijklmnop"
  collector_name    = "azure-poc"
  subnet_id         = "<subnet_id here>"
  admin_username    = "medora"
}
```
