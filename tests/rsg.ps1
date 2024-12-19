Import-Module -Name Az.Resources
$subscriptionId = "0b7e0b83-0035-48fe-92fe-bf1143f2e715"
Select-AzSubscription -Subscription $subscriptionId
# Log environment variables
Write-Output "-----------------------------------------------------------------------"
Write-Output " "
Describe 'Azure VM Tests' {

    # Test 1: VM should exist
    It 'VM should exist' {
        $vm = Get-AzVM -ResourceGroupName 'YourResourceGroupName' -Name 'YourVMName'
        $vm | Should -Not -BeNullOrEmpty
    }

# Test 2: VM should be in running state
    It 'VM should be in running state' {
        # Get VM details
        $vm = Get-AzVM -ResourceGroupName 'YourResourceGroupName' -Name 'YourVMName'
        $status = $vm.Statuses | Where-Object { $_.Code -eq 'PowerState/running' }
        $status | Should -Not -BeNullOrEmpty
    }
}

    # Test 3: VM should have correct size
    It 'VM should have correct size' {
        $vm = Get-AzVM -ResourceGroupName 'YourResourceGroupName' -Name 'YourVMName'
        $vm.HardwareProfile.VmSize | Should -Be 'Standard_B1s'  # Change this to your expected size
    }

}
# Log environment variables
Write-Output "------------------------------------------------------------------------"
Write-Output " "