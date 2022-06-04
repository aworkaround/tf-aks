variable "resource_group_name" {
  default = "aks-cluster-rg"
}

variable "ssh_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "location" {
  default = "eastus"
}

variable "cluster_name" {
  default = "aks-cluster-test"
}

variable "dns_prefix" {
  default = "aksclusterxkg"
}

variable "node_vm_size" {
  default = "Standard_D2_v2"
}

variable "service_principal_id" {}
variable "service_principal_secret" {}
