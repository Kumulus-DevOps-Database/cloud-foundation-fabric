# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# The `impersonate_service_account` option require the identity launching terraform
# role `roles/iam.serviceAccountTokenCreator` on the Service Account specified.

terraform {
  backend "gcs" {
    bucket                      = "tfstate-datafoundation"
    prefix                      = "teste"
    # impersonate_service_account = "terraform-automation@projeto-gcp-20221108-102-937.iam.gserviceaccount.com"
  }
}
provider "google" {
  # credentials = file("projeto-gcp-20221108-102-937-3756c0dae29f")

  project = "projeto-gcp-20221108-102-937"
  region  = "us-central1"
  zone    = "us-central1-c"
  # impersonate_service_account = "terraform-automation@projeto-gcp-20221108-102-937.iam.gserviceaccount.com"
}
provider "google-beta" {
  # impersonate_service_account = "terraform-automation@projeto-gcp-20221108-102-937.iam.gserviceaccount.com"
}
