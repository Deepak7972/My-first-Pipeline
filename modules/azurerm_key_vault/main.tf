resource "azurerm_key_vault" "kv" {
  for_each            = var.key_vault
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tenant_id           = data.azurerm_client_config.tenant_id.tenant_id
  sku_name            = each.value.sku_name
}





















# rbac_authorization_enabled  = false
# enabled_for_disk_encryption = true
# soft_delete_retention_days  = 7
# purge_protection_enabled    = false
# access_policy {
#   tenant_id = data.azurerm_client_config.current.tenant_id
#   object_id = data.azurerm_client_config.current.object_id

# key_permissions = [
#   "Get",
# ]

# secret_permissions = [
#   "Get",
# ]

# storage_permissions = [
#   "Get",
# ]
