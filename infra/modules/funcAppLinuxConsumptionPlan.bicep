param tags object = {}

@description('Location for all resources.')
param location string = resourceGroup().location

@description('The hosting plan name.')
param hostingPlanName string

resource hostingPlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: hostingPlanName
  location: location
  tags: tags
  sku: {
    name: 'Y1'
    tier: 'Dynamic'
    size: 'Y1'
    family: 'Y'
  }
  properties: {
    reserved: true
  }
}
