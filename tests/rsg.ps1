Describe "Check if Resource Group exists" {

    $resourceGroupName = "NetworkWatcherRG"

    It "should exist in Azure" {
        # Use Get-AzResourceGroup to check if the resource group exists
        $resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
        
        # Assert that the resource group was found
        $resourceGroup | Should -Not -BeNullOrEmpty
    }
}
