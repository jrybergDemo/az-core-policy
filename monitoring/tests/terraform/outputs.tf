output "kv_id" {
  value = azurerm_key_vault.keyvault.id
}

output "sa_id" {
  value = azurerm_storage_account.sa.id
}

output "aa_id" {
  value = azurerm_automation_account.AutomationAccount.id
}

output "rv_id" {
  value = azurerm_recovery_services_vault.recoveryvault.id
}

output "bastion_id" {
  value = azurerm_bastion_host.bastion_host.id
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "nic_id" {
  value = azurerm_network_interface.win_nic.id
}

output "sql_id" {
  value = azurerm_sql_server.sql_server.id
}

output "win_id" {
  value = azurerm_windows_virtual_machine.win_vm.id
}

output "linux_id" {
  value = azurerm_linux_virtual_machine.linux_vm.id
}

output "elastic_id" {
  value = azurerm_sql_elasticpool.elastic_pool.id
}

output "synapse_id" {
  value = azurerm_synapse_workspace.synapseworkspace.id
}

output "vnetgw_id" {
  value = azurerm_virtual_network_gateway.vnet_gw.id
}

output "mysql" {
  value = azurerm_mysql_server.mysql.id
}