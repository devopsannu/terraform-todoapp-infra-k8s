parent_resource_group = {
  rg1 = {
    rg_name     = "prod-k8s-rg1"
    location = "central india"
    tags     = {
      environment = "production"
      project     = "k8s-microservices"
    }
  }
}
 


parent_aks_clusters = {
  aks1 = {
    aks_name           = "prodaks01"
    rg_name            = "prod-k8s-rg1"
    location           = "central india"
    dns_prefix         = "prodaksjustice"
    node_count         = 1
    vm_size            = "Standard_B4s_v2"
    kubernetes_version = "1.32.9"

    tags = {
      environment = "production"
      project     = "avengers"
    }
  }
}

parent_acr_instances = {
  acr1 = {
    acr_name      = "prodacrk8s01"
    rg_name       = "prod-k8s-rg1"
    location      = "central india"
    acr_sku       = "Standard"
    admin_enabled = false
  }
}

parent_sql_server = {
  sql1 = {
    name                          = "prodsqlk8s01"
    rg_name                       = "prod-k8s-rg1"
    location                      = "central india"
    version                       = "12.0"
    administrator_login           = "sqladminuser"
    administrator_login_password  = "Sql@12345678"
    public_network_access_enabled = true
    tags = {
      environment = "prod"
      team        = "todappteam"
    }
  }
}

parent_sql_databases = {
  db1 = {
    name         = "sqlavengersdb001"
    server_name  = "prodsqlk8s01"
    rg_name      = "prod-k8s-rg1"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
  }
}
parent_keyvault = {
  kv1 = {
    name                        = "prodkvk8s01"
    rg_name                     = "prod-k8s-rg1"
    enabled_for_disk_encryption = true
    location                    = "central india"
    purge_protection_enabled    = false
    soft_delete_retention_days  = 7
    sku_name                    = "standard"
  }
}