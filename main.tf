resource "azurerm_resource_group" "resgrp" {
  name     = "${var.name}-resgrp"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name}-vnet"
  location            = azurerm_resource_group.resgrp.location
  resource_group_name = azurerm_resource_group.resgrp.name
  address_space       = ["192.168.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.name}-subnet"
  resource_group_name  = azurerm_resource_group.resgrp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.1.0/24"]
  service_endpoints    = ["Microsoft.Sql"]
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = azurerm_resource_group.resgrp.location
  resource_group_name = azurerm_resource_group.resgrp.name
  dns_prefix          = var.name

  default_node_pool {
    name           = "nodepool"
    node_count     = 2
    vm_size        = "Standard_B2s"
    vnet_subnet_id = azurerm_subnet.subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}

data "azurerm_public_ip" "pubip" {
  name                = reverse(split("/", tolist(azurerm_kubernetes_cluster.aks.network_profile.0.load_balancer_profile.0.effective_outbound_ips)[0]))[0]
  resource_group_name = azurerm_kubernetes_cluster.aks.node_resource_group
}

resource "azurerm_role_assignment" "aks_cluster_admin" {
  scope                = azurerm_kubernetes_cluster.aks.id
  role_definition_name = "Azure Kubernetes Service Cluster Admin Role"
  principal_id         = var.principal_id
}

resource "azurerm_role_assignment" "aks_cluster_user" {
  scope                = azurerm_kubernetes_cluster.aks.id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id         = var.principal_id
}
