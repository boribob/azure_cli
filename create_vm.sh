#!/bin/bash

#variables
user_name="butter"

rg_name="${user_name}_cli_scripting_rg"
vm_name="${user_name}_cli_vm"
nsg_name="${user_name}_nsg"
subnet_name="${user_name}_subnet"
vnet_name="${user_name}_vnet"

location=koreacentral
vm_size=Standard_B1s
vm_image=win2016datacenter

vm_admin_username=azureuser
vm_admin_password='!QAZ2wsx#EDC'


#vm: provision
#vm_data=$(az vm create -n $vm_name --size $vm_size --imgae $vm_image --admin-username $vm_admin_username --admin-password $vm_admin_password --authentication-type password --assign-identity)
az vm create --name $vm_name --resource-group $rg_name\
  --size $vm_size --image $vm_image\
  --admin-username $vm_admin_username\
  --admin-password $vm_admin_password\
  --authentication-type password\
  --location $location\
  --nsg $nsg_name\
  --nsg-rule RDP\
  --os-disk-caching ReadWrite\
  --public-ip-sku Standard\
  --storage-sku Standard_LRS\
  --subnet $subnet_name\
  --vnet-name $vnet_name

