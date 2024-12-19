Import-Module -Name Az

Describe "Check if Resource Group exists" {

    $resourceGroupName = "NetworkWatcherRG"

    It "should exist in Azure" {
        # Debugging: Print the value of $resourceGroupName
        Write-Host "Resource Group Name: $resourceGroupName"

        # Use Get-AzResourceGroup to check if the resource group exists
        $resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
        
        # Assert that the resource group was found
        $resourceGroup | Should -Not -BeNullOrEmpty
    }
}
