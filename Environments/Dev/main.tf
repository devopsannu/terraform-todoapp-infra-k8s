module "resource_group" {
  source         = "../../modules/azurerm_resource_group"
  resource_group = var.parent_resource_group

}

module "aks" {
  depends_on         = [module.resource_group]
  source             = "../../modules/azurerm_aks"
  child_aks_clusters = var.parent_aks_clusters
}

module "acr" {
  depends_on          = [module.resource_group]
  source              = "../../modules/azurerm_acr"
  child_acr_instances = var.parent_acr_instances
}

module "mssql_server" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_mssql_server"
  servers    = var.parent_sql_server
}

module "mssql_database" {
  depends_on = [module.mssql_server]
  source     = "../../modules/azurerm_mssql_db"
  database   = var.parent_sql_databases
}

module "keyvault" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_keyvault"
  keyvault   = var.parent_keyvault
}