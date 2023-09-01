output "kv_id" {
  value = {
      for kv in azurerm_key_vault.keyvault:
      kv.id => kv.id
    }
}

output "sa_id" {
  value = {
    for sa in azurerm_storage_account.sa:
        sa.id => sa.id
    }
}

output "aa_id" {
  value = {
    for aa in azurerm_automation_account.AutomationAccount:
        aa.id => aa.id
    }
}

output "rv_id" {
  value = {
    for rv in azurerm_recovery_services_vault.recoveryvault:
        rv.id => rv.id
    }
}

output "bastion_id" {
  value = {
    for bstn in azurerm_bastion_host.bastion_host:
        bstn.id => bstn.id
    }
}

output "vnet_id" {
  value = {
    for vnt in azurerm_virtual_network.vnet:
        vnt.id => vnt.id
    }
}

output "sql_id" {
  value = {
    for sql in azurerm_mssql_server.sql_server:
        sql.id => sql.id
    }
}

output "win_custom_id" {
  value = {
    for winc in azurerm_windows_virtual_machine.custom_win_vm:
        winc.id => winc.id
    }
}

output "win_nic_id" {
  value = {
    for wnc in azurerm_network_interface.win_nic:
        wnc.id => wnc.id
    }
}

output "linux_id" {
  value = {
    for lnx in azurerm_linux_virtual_machine.linux_vm:
        lnx.id => lnx.id
    }
}

output "linux_custom_rhel_id" {
  value = {
    for lnxrc in azurerm_linux_virtual_machine.custom_rhel_vm:
        lnxrc.id => lnxrc.id
    }
}

output "linux_custom_ubuntu_id" {
  value = {
    for lnxuc in azurerm_linux_virtual_machine.custom_ubuntu_vm:
        lnxuc.id => lnxuc.id
    }
}

output "linux_nic_id" {
  value = {
    for lnic in azurerm_network_interface.linux_nic:
        lnic.id => lnic.id
    }
}

output "elastic_id" {
  value = {
    for elp in azurerm_mssql_elasticpool.elastic_pool:
        elp.id => elp.id
    }
}

output "synapse_id" {
  value = {
    for synp in azurerm_synapse_workspace.synapseworkspace:
        synp.id => synp.id
    }
}

output "vnetgw_id" {
  value = {
    for vgw in azurerm_virtual_network_gateway.vnet_gw:
        vgw.id => vgw.id
    }
}

output "mysql" {
  value = {
    for msql in azurerm_mysql_server.mysql:
        msql.id => msql.id
    }
}

output "ase_id" {
  value = {
    for aseid in azurerm_app_service_environment.ase:
        aseid.id => aseid.id
    }
}

output "asp_id" {
  value = {
    for asp in azurerm_service_plan.asp:
        asp.id => asp.id
    }
}

output "app_id" {
  value = {
    for appid in azurerm_linux_web_app.app_service:
        appid.id => appid.id
    }
}

output "nsg_id" {
  value = {
      for nsg in azurerm_network_security_group.nsg:
      nsg.id => nsg.id
    }
}

output "func_app_id" {
  value = {
    for funcappid in azurerm_linux_function_app.func_app:
        funcappid.id => funcappid.id
    }
}

output "ml_id" {
  value = {
    for mlid in azurerm_machine_learning_workspace.machine_learning:
        mlid.id => mlid.id
    }
}

output "la_id" {
  value = {
    for la in azurerm_logic_app_workflow.logic_apps:
        la.id => la.id
    }
}