shutdown_time = "2359"
shutdown_timezone = "Pacific Standard Time"

app_insight_list    =  { 
    eitaastest-va = "usgovvirginia" 
    }

key_vault_list  = {
    eitaastest-tx = "usgovtexas",
    eitaastest-va = "usgovvirginia"
  }

storage_account_list    = {
    eitaastesttx = "usgovtexas",
    eitaastestva = "usgovvirginia"
  }

storage_datalake_filesystem_list    = {
    eitaasfilesystemtx = {
      location        = "usgovtexas",
      storage_account = "eitaastesttx"
    },
    eitaasfilesystemva = {
      location        = "usgovvirginia",
      storage_account = "eitaastestva"
    }
  }

automation_account  = {
    eitaastest-tx = "usgovtexas",
    eitaastest-va = "usgovvirginia"
  }

recovery_services_vault_list    = {
    eitaastest-tx = "usgovtexas",
    eitaastest-va = "usgovvirginia"
  }

bastion_public_ip_list  = {
    eitaastest-tx-bastion-ip = "usgovtexas",
    eitaastest-va-bastion-ip = "usgovvirginia"
  }

bastion_host_list   = {
    bastion-host-tx = {
      location      = "usgovtexas",
      public_ip     = "eitaastest-tx-bastion-ip",
      bastion_vnet  = "eitaastest-tx"
    },
    bastion-host-va = {
      location      = "usgovvirginia",
      public_ip     = "eitaastest-va-bastion-ip",
      bastion_vnet  = "eitaastest-va"
    }
  }

machine_learning_list      = {
    machine-learning-va = {
      location        = "usgovvirginia",
      key_vault       = "eitaastest-va",
      storage_account = "eitaastestva",
      app_insight     = "eitaastest-va"
    }
  }

network_security_group_list      = {
    eitaastest-tx = "usgovtexas",
    eitaastest-va = "usgovvirginia"
  }

sql_server_list      = {
    eitaastesttxsqlserver = "usgovtexas",
    eitaastestvasqlserver = "usgovvirginia"
  }

synapse_list      = {
    synapseworkspacetx = {
      location      = "usgovtexas",
      dl_filesystem = "eitaasfilesystemtx"
    },
    synapseworkspaceva = {
      location      = "usgovvirginia",
      dl_filesystem = "eitaasfilesystemva"
    }
  }

mysql_server_list      = {
    eitaastesttxmysql = "usgovtexas",
    eitaastestvamysql = "usgovvirginia"
  }

mssql_server_list      = {
    mssqlservertx = "usgovtexas",
    mssqlserverva = "usgovvirginia"
  }

vnet_gwy_ip_list      = {
    eitaastest-gwy-ip-tx = "usgovtexas",
    eitaastest-gwy-ip-va = "usgovvirginia"
  }

vnet_gwy_list      = {
    eitaastest-gwy-tx = {
      location      = "usgovtexas",
      vnet_gwy_ip   = "eitaastest-gwy-ip-tx",
      gateway_vnet  = "eitaastest-tx"
    },
    eitaastest-gwy-va = {
      location      = "usgovvirginia",
      vnet_gwy_ip   = "eitaastest-gwy-ip-va",
      gateway_vnet  = "eitaastest-va"
    }
  }

vnet_list      = {
    eitaastest-tx = "usgovtexas",
    eitaastest-va = "usgovvirginia"
  }

subnet_list      = {
    eitaastest-subnet-tx = {
      location        = "usgovtexas",
      vnet_name       = "eitaastest-tx",
      address_prefix  = "192.0.0.32/28"
    },
    eitaastest-subnet-va = {
      location        = "usgovvirginia",
      vnet_name       = "eitaastest-va",
      address_prefix  = "192.0.0.64/28"
    },
    eitaastest-ase-subnet-va = {
      location          = "usgovvirginia",
      vnet_name         = "eitaastest-va",
      address_prefix    = "192.0.1.0/24"
    },
    eitaastest-app-gwy-subnet-tx = {
      location          = "usgovtexas",
      vnet_name         = "eitaastest-tx",
      address_prefix    = "192.0.0.144/28"
    },
    eitaastest-app-gwy-subnet-va = {
      location          = "usgovvirginia",
      vnet_name         = "eitaastest-va",
      address_prefix    = "192.0.0.144/28"
    }
  }

win_nic_list      = {
    eitaastest-win-nic-tx = {
      location    = "usgovtexas",
      subnet_name = "eitaastest-subnet-tx"
    },
    eitaastest-win-nic-va = {
      location     = "usgovvirginia",
      subnet_name  = "eitaastest-subnet-va"
    },
    eitaastest-custom-image-win-nic-tx = {
      location    = "usgovtexas",
      subnet_name = "eitaastest-subnet-tx"
    },
    eitaastest-custom-image-win-nic-va = {
      location     = "usgovvirginia",
      subnet_name  = "eitaastest-subnet-va"
    }
  }

win_vm_list      = {
    eitaastswinvmtx = {
      location  = "usgovtexas",
      win_nic   = "eitaastest-win-nic-tx"
    },
    eitaastswinvmva = {
      location  = "usgovvirginia",
      win_nic   = "eitaastest-win-nic-va"
    }
  }

linux_nic_list      = {
    eitaastest-linux-nic-tx = {
      location    = "usgovtexas",
      subnet_name = "eitaastest-subnet-tx"
    },
    eitaastest-linux-nic-va = {
      location     = "usgovvirginia",
      subnet_name  = "eitaastest-subnet-va"
    },
    eitaastest-custom-image-ubun-nic-tx = {
      location    = "usgovtexas",
      subnet_name = "eitaastest-subnet-tx"
    },
    eitaastest-custom-image-ubun-nic-va = {
      location     = "usgovvirginia",
      subnet_name  = "eitaastest-subnet-va"
    },
    eitaastest-custom-image-rhel-nic-tx = {
      location    = "usgovtexas",
      subnet_name = "eitaastest-subnet-tx"
    },
    eitaastest-custom-image-rhel-nic-va = {
      location     = "usgovvirginia",
      subnet_name  = "eitaastest-subnet-va"
    }
  }

linux_vm_list      = {
    eitaaslinuxvmtx = {
      location  = "usgovtexas",
      linux_nic = "eitaastest-linux-nic-tx"
    },
    eitaaslinuxvmva = {
      location  = "usgovvirginia",
      linux_nic = "eitaastest-linux-nic-va"
    }
  }

custom_image_windows_vm_list      = {
    custimgwinvmtx = {
      location          = "usgovtexas",
      nic               = "eitaastest-custom-image-win-nic-tx",
      image_gallery_rg  = "D-TX-EITAAS-CAS-IMAGEGALLERY"
    },
    custimgwinvmva = {
      location          = "usgovvirginia",
      nic              = "eitaastest-custom-image-win-nic-va",
      image_gallery_rg  = "D-VA-EITAAS-CAS-IMAGEGALLERY"
    }
  }

custom_image_ubuntu_vm_list      = {
    custimgubunvmtx = {
      location          = "usgovtexas",
      nic               = "eitaastest-custom-image-ubun-nic-tx",
      image_gallery_rg  = "D-TX-EITAAS-CAS-IMAGEGALLERY"
    },
    custimgubunvmva = {
      location          = "usgovvirginia",
      nic               = "eitaastest-custom-image-ubun-nic-va",
      image_gallery_rg  = "D-VA-EITAAS-CAS-IMAGEGALLERY"
    }
  }

custom_image_rhel_vm_list      = {
    custimgrhelvmtx = {
      location          = "usgovtexas",
      nic               = "eitaastest-custom-image-rhel-nic-tx",
      image_gallery_rg  = "D-TX-EITAAS-CAS-IMAGEGALLERY"
    },
    custimgrhelvmva = {
      location          = "usgovvirginia",
      nic               = "eitaastest-custom-image-rhel-nic-va",
      image_gallery_rg  = "D-VA-EITAAS-CAS-IMAGEGALLERY"
    }
  }

image_list      = {
    win_base_image      = "win2019STIG.base",
    ubuntu_base_image   = "ubuntu-1804-secure-eitaas.base",
    rhel_base_image     = "rhel-79-secure-eitaas.base"
  }

cosmos_db_list      = {
    eitaascosmosdbtx = {
      location          = "usgovtexas",
      failover_location = "usgovvirginia"
    },
    eitaascosmosdbva = {
      location          = "usgovvirginia",
      failover_location = "usgovtexas"
    }
  }

ase_list      = {
    "eitaastest-ase-va": {
      subnet_name:  "eitaastest-ase-subnet-va"
    }
  }

function_app_list      = {
    "eitaastest-funcapp-tx": {
      location              = "usgovtexas",
      asp_name              = "eitaastest-asp-tx",
      storage_account_name  = "eitaastesttx"
    },
    "eitaastest-funcapp-va": {
      location              = "usgovvirginia",
      asp_name              = "eitaastest-asp-va",
      storage_account_name  = "eitaastestva"
    }
  }

app_gateway_list      = {
    eitaastest-app-gwy-tx = {
      location            = "usgovtexas",
      subnet_name         = "eitaastest-app-gwy-subnet-tx"
    },
    eitaastest-app-gwy-va = {
      location            = "usgovvirginia",
      subnet_name         = "eitaastest-app-gwy-subnet-va"
    }
  }

app_service_plan_list      = {
    eitaastest-asp-tx = {
      location            = "usgovtexas"
    },
    eitaastest-asp-va = {
      location            = "usgovvirginia"
    }
  }

app_service_list    = {
    eitaastest-app-service-tx = {
      location            = "usgovtexas",
      asp_name            = "eitaastest-asp-tx"
    },
    eitaastest-app-service-va = {
      location            = "usgovvirginia",
      asp_name            = "eitaastest-asp-va"
    }
  }

win_linux_vms_shutdown    = {
    eitaastswinvmtx = "usgovtexas",
    eitaastswinvmva = "usgovvirginia",
    custimgwinvmtx  = "usgovtexas",
    custimgwinvmva  = "usgovvirginia",
    eitaaslinuxvmtx = "usgovtexas",
    eitaaslinuxvmva = "usgovvirginia",
    custimgubunvmtx = "usgovtexas",
    custimgubunvmva = "usgovvirginia",
    custimgrhelvmtx = "usgovtexas",
    custimgrhelvmva = "usgovvirginia"
  }

  logic_apps  = {
    eitaastest-la-tx = "usgovtexas",
    eitaastest-la-va = "usgovvirginia"
  }