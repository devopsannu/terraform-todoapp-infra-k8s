resource "azurerm_container_registry" "acr_k8s" {
  for_each            = var.child_acr_instances
  name                = each.value.acr_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  sku                 = each.value.acr_sku
  admin_enabled       = each.value.admin_enabled
}
