Import-Module -Name Az.Resources

$subscriptionId = "0b7e0b83-0035-48fe-92fe-bf1143f2e715"
Select-AzSubscription -Subscription $subscriptionId

Describe 'Azure VM Tests' {

    # Test 1: VM should exist
    It 'VM should exist' {
        $vm = Get-AzVM -ResourceGroupName 'YourResourceGroupName' -Name 'YourVMName'
        $vm | Should -Not -BeNullOrEmpty
    }

    # Test 2: VM should be in running state
    It 'VM should be in running state' {
        $vm = Get-AzVM -ResourceGroupName 'YourResourceGroupName' -Name 'YourVMName'
        Write-Host "VM Statuses: $($vm.Statuses | Select-Object Code)"
        $status = $vm.Statuses | Where-Object { $_.Code -match 'PowerState/running' }
        $status | Should -Not -BeNullOrEmpty
    }

    # Test 3: VM should have correct size
    It 'VM should have correct size' {
        $vm = Get-AzVM -ResourceGroupName 'YourResourceGroupName' -Name 'YourVMName'
        $vm.HardwareProfile.VmSize | Should -Be 'Standard_B1s'  
    }

}
