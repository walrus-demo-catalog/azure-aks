## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.94.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.94.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_resource_group.resgrp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.aks_cluster_admin](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.aks_cluster_user](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_public_ip.pubip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/public_ip) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The Azure Region in which all resources in this module should be provisioned | `string` | `"westus"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Azure Kubernetes cluster | `string` | n/a | yes |
| <a name="input_principal_id"></a> [principal\_id](#input\_principal\_id) | The ID of the Principal (User, Group or Service Principal) to assign the Cluster Managed Role Definition to | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_cluster_egress_ip"></a> [cluster\_egress\_ip](#output\_cluster\_egress\_ip) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | n/a |
| <a name="output_version"></a> [version](#output\_version) | n/a |
