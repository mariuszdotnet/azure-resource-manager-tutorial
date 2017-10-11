# Variables that need to be set to start working with ARM.

# The subscriptionId
$subscriptionId = '<SUBSCRIPTION ID>'

# Root path to script, template and parameters.  All have to be in the same folder.
$rootPathToFiles = '<ROOT PATH TO FILES>'

# Name of the resource group you are targeting the deployment into
$resourceGroupName = '<RESOURCE GROUP NAME>'

# Resource Group Location 
$resourceGroupLocation = '<RESOURCE GROUP LOCATION>' # Run <Get-AzureLocation> to find out azure locations; EXAMPLE: 'East US 2'

# Name of the deployment; User friendly name to reference the deployment.
$deploymentName = '<DEPLOYMENT NAME>'

# Authenticate Against you Azure Tenant
Login-AzureRmAccount

# List subscriptions that are available to you
Get-AzureSubscription

# Select the subscription you want to work on
Select-AzureRmSubscription -SubscriptionId $subscriptionId

# Run the below to test the ARM template
Test-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "$rootPathToFiles\azuredeploy.json" -TemplateParameterFile "$rootPathToFiles\azuredeploy.parameters.json"

# Deploy the ARM template using the parameter file
New-AzureRmResourceGroupDeployment -verbose -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateFile "$rootPathToFiles\azuredeploy.json" -TemplateParameterFile "$rootPathToFiles\azuredeploy.parameters.json"

# Deploy the ARM templatet inputing parameters manually via CLI
#New-AzureRmResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateFile "$rootPath\azuredeploy.json"

# Create the new Azure Resource Group
#New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation -Force

# Deleate Azure Resource Group
#Remove-AzureRmResourceGroup -Name $resourceGroupName -Force