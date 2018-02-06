# Variables that need to be set to start working with ARM.

# The subscriptionId
$subscriptionId = '5aec60e9-f535-4bd7-a951-2833f043e918'

# Root path to script, template and parameters.  All have to be in the same folder.
$rootPathToFiles = 'C:\git\azure-resource-manager-tutorial'

# Name of the resource group you are targeting the deployment into
$resourceGroupName = 'arm-demo-rg'

# Resource Group Location 
$resourceGroupLocation = 'East US 2' # Run <Get-AzureLocation> to find out azure locations; EXAMPLE: 'East US 2'

# Name of the deployment; User friendly name to reference the deployment.
$deploymentName = 'Deployment1'

# Authenticate Against you Azure Tenant
Login-AzureRmAccount

# List subscriptions that are available to you
Get-AzureRmSubscription

# Select the subscription you want to work on
Select-AzureRmSubscription -SubscriptionId $subscriptionId

# Run the below to test the ARM template
Test-AzureRmResourceGroupDeployment -Verbose -ResourceGroupName $resourceGroupName -TemplateFile "$rootPathToFiles\azuredeploy.json" -TemplateParameterFile "$rootPathToFiles\azuredeploy.parameters.json"

# Deploy the ARM template using the parameter file
New-AzureRmResourceGroupDeployment -Mode Incremental -verbose -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateFile "$rootPathToFiles\azuredeploy.json" -TemplateParameterFile "$rootPathToFiles\azuredeploy.parameters.json"

# Deploy the ARM templatet inputing parameters manually via CLI
#New-AzureRmResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateFile "$rootPath\azuredeploy.json"

# Create the new Azure Resource Group
New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation -Force

# Deleate Azure Resource Group
#Remove-AzureRmResourceGroup -Name $resourceGroupName -Force