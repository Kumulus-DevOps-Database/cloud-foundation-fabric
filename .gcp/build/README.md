# Data Platform

This Cloud Build implements the Continuous Integration and Continuous Deployment of [Data Platform Foundations](../../blueprints/data-solutions/data-platform-foundations).

## How to run this script

To deploy this blueprint on your GCP organization, you will need

- a folder or organization where new projects will be created
- a billing account that will be associated with the new projects with quota to associate 10 more projects

The Data Platform is meant to be executed by a Service Account (or a regular user) having this minimal set of permission:

- **Billing account**
  - `roles/billing.user`
- **Folder level**:
  - `roles/resourcemanager.folderAdmin`
  - `roles/resourcemanager.projectCreator`
- **KMS Keys** (If CMEK encryption in use):
  - `roles/cloudkms.admin` or a custom role with `cloudkms.cryptoKeys.getIamPolicy`, `cloudkms.cryptoKeys.list`, `cloudkms.cryptoKeys.setIamPolicy` permissions
- **Shared VPC host project** (if configured):\
  - `roles/compute.xpnAdmin` on the host project folder or org
  - `roles/resourcemanager.projectIamAdmin` on the host project, either with no conditions or with a condition allowing [delegated role grants](https://medium.com/google-cloud/managing-gcp-service-usage-through-delegated-role-grants-a843610f2226#:~:text=Delegated%20role%20grants%20is%20a,setIamPolicy%20permission%20on%20a%20resource.) for `roles/compute.networkUser`, `roles/composer.sharedVpcAgent`, `roles/container.hostServiceAgentUser`

## Variable configuration

There are three sets of variables you will need to fill in:

```tfvars
billing_account_id  = "111111-222222-333333"
older_id            = "folders/123456789012"
organization_domain = "domain.com"
prefix              = "myco"
```

For more fine details check variables on [`variables.tf`](../../blueprints/data-solutions/data-platform-foundations/variables.tf) and update according to the desired configuration. Remember to create team groups described [below](#groups).
