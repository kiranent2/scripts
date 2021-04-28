#Select the right Azure subscription
Select-AzSubscription -SubscriptionName 'Free Trial'
#Select the RG, VM, Location, Snapshot details
$rgName = 'Test-RG'
$vmName = 'vmtest200'
$location = 'eastus' 
$snapshotName = 'vmtest200_OsDisk_snap3' 
# Get the VM 
$vm = Get-AzVM -ResourceGroupName $rgName -Name $vmName
# Make sure the VM is stopped\deallocated
Stop-AzVM -ResourceGroupName $rgName -Name $vmName
# It triggers a snapshot of OS disk
$snapshot =  New-AzSnapshotConfig -SourceUri $vm.StorageProfile.OsDisk.ManagedDisk.Id -Location $location -CreateOption copy
New-AzSnapshot -Snapshot $snapshot -SnapshotName $snapshotName -ResourceGroupName $rgName
# Update the new disk size in GBs
$disk= Get-AzDisk -ResourceGroupName $rgName -DiskName $vm.StorageProfile.OsDisk.Name
$disk.DiskSizeGB = 64
Update-AzDisk -ResourceGroupName $rgName -Disk $disk -DiskName $disk.Name
# Start the VM
Start-AzVM -ResourceGroupName $rgName -Name $vmName