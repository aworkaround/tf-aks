# Create ResourceGroup
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

data "local_file" "ssh_key" {
  filename = var.ssh_key_path
}

# Create AKS
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  node_resource_group = var.resource_group_name
  dns_prefix          = var.dns_prefix
  default_node_pool {
    name                = "default"
    enable_auto_scaling = true
    vm_size             = var.node_vm_size
    max_pods            = 4
    max_count           = 4
    min_count           = 2
    node_count          = 2
  }
  role_based_access_control_enabled = true

  key_vault_secrets_provider {
    secret_rotation_enabled  = true
    secret_rotation_interval = "5m"
  }
  kubernetes_version = "1.23.7"
  service_principal {
    client_id     = var.service_principal_id
    client_secret = var.service_principal_secret
  }
  linux_profile {
    admin_username = "kamal"
    ssh_key {
      key_data = data.local_file.ssh_key.content
    }
  }
}
