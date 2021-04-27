Connect-AzAccount
Select-AzSubscription -SubscriptionName 'Free Trial'
$rgName = 'Test-RG'
$vmName = 'vmtest50'
$vm = Get-AzVM -ResourceGroupName $rgName -Name $vmName
Stop-AzVM -ResourceGroupName $rgName -Name $vmName
$vm.StorageProfile.OSDisk.DiskSizeGB = 60
Update-AzVM -ResourceGroupName $rgName -VM $vm
Start-AzVM -ResourceGroupName $rgName -Name $vmName