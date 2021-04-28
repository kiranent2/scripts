Connect-AzAccount
Select-AzSubscription -SubscriptionName 'Free Trial'
$rgName = 'Test-RG'
$vmName = 'vmtest50'
$location = 'eastus' 
$snapshotName = 'osdisksnap' 
$vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName
Stop-AzVM -ResourceGroupName $rgName -Name $vmName
$snapshot =  New-AzSnapshotConfig -SourceUri $vm.StorageProfile.OsDisk.ManagedDisk.Id -Location $location -CreateOption copy
New-AzSnapshot -Snapshot $snapshot -SnapshotName $snapshotName -ResourceGroupName $resourceGroupName 