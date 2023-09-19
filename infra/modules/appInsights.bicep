@description('The name of the Azure Function app.')
param functionAppName string

@description('Location for all resources.')
param location string = resourceGroup().location

var applicationInsightsName = functionAppName

resource applicationInsight 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  tags: {
    'hidden-link:${resourceId('Microsoft.Web/sites', functionAppName)}': 'Resource'
  }
  properties: {
    Application_Type: 'web'
  }
  kind: 'web'
}
