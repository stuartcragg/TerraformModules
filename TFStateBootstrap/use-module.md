# Module Call

```terraform
module "tf_storage" {
  source  = "git::https://github.com/<USERNAME>/<REPO>.git//<PATH_TO_MODULE>"
  
  tenant_id = ""
  subscription_id = ""
  tf_state_rg = "" // Default: rg-terraform-state-storage-${var.location}-${var.environment}-1
  location = ""
  storage_account = "" // The storage account name must be exactly 19 characters, and can only contain lowercase letters and numbers.
  environment = "" // Is this environment Production / Staging / Development etc?

  tags = {}
}

