
variable "child_acr_instances" {
  description = "Map of ACR instances to create"
  type = map(object({
    acr_name        = string
    rg_name         = string
    location        = string
    acr_sku         = string
    admin_enabled   = bool
  }))
  
}