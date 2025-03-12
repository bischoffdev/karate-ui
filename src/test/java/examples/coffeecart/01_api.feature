Feature: Coffee cart API

Scenario: Product API test
  * url baseUrl
  * path 'list.json'
  * method get
  * def products = response
  * print products 
  * match products[0].name == "Espresso"
  * def onlyTheNames = $[*].name
  * print 'Product names', onlyTheNames