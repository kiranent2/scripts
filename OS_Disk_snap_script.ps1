Connect-AzAccount
Select-AzSubscription -SubscriptionName 'Free Trial'
$rgName = 'Test-RG'
$vmName = 'vmtest50'
$location = 'eastus' 
$snapshotName = 'osdisksnap' 
$vm = Get-AzVM -ResourceGroupName $rgName -Name $vmName
Stop-AzVM -ResourceGroupName $rgName -Name $vmName
$disk = Get-AzDisk -ResourceGroupName $rgName -DiskName $vm.StorageProfile.OsDisk.Name
$snapshot =  New-AzSnapshotConfig -SourceUri $vm.StorageProfile.OsDisk.ManagedDisk.Id -Location $location -CreateOption copy
New-AzSnapshot -Snapshot $snapshot -SnapshotName $snapshotName -ResourceGroupName $rgName