param repositoryUrl string
param repositoryToken string

resource webapp 'Microsoft.Web/staticSites@2020-12-01' = {
  name: 'beers-app'
  location: resourceGroup().location
  properties: {
    repositoryUrl: repositoryUrl
    repositoryToken: repositoryToken
    branch: 'main'
  }
  sku: {
    name: 'Free'
  }
}
