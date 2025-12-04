# Terraform configuration

terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116.0"
    }
  }
}

provider "azurerm" {
  features {}

}

# Resource Group
resource "azurerm_resource_group" "aks_rg" {
  name     = "production-aks-rg"
  location = "East US"

  tags = {
    project     = "production-aks"
    environment = "production"
  }
}

# AKS Cluster

resource "azurerm_kubernetes_cluster" "main" {
  name                = "production-aks-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "prod-aks"
  kubernetes_version  = "1.33"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
    project     = "Production AKS Platform"
  }
}

# Outputs
output "cluster_name" {
  value = azurerm_kubernetes_cluster.main.name

}

output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = azurerm_resource_group.aks_rg.name

}

output "kube_config_command" {
  description = "Command to configure kubectl"
  value       = "az aks get-credentials --resource-group ${azurerm_resource_group.aks_rg.name} --name ${azurerm_kubernetes_cluster.main.name}"

}
