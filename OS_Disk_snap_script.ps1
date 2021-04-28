Connect-AzAccount
Select-AzSubscription -SubscriptionName 'Free Trial'
$rgName = 'Test-RG'
$vmName = 'vmtest200'
$location = 'eastus' 
$snapshotName = 'vmtest200_OsDisk_snap2' 
$vm = Get-AzVM -ResourceGroupName $rgName -Name $vmName
Stop-AzVM -ResourceGroupName $rgName -Name $vmName
$snapshot =  New-AzSnapshotConfig -SourceUri $vm.StorageProfile.OsDisk.ManagedDisk.Id -Location $location -CreateOption copy
New-AzSnapshot -Snapshot $snapshot -SnapshotName $snapshotName -ResourceGroupName $rgName