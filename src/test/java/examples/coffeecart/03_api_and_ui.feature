Feature: Coffee cart API and UI

Scenario: API and UI test
    * url baseUrl
    * path 'list.json'
    * method get
    * def productNames = $[*].name
    * def filteredProductNames = productNames.filter(name => !name.startsWith("(Discounted)"))
    * driver baseUrl
    * def productsWeb = locateAll('//h4/text()')
    * def productNamesWeb = []
    * productsWeb.forEach(product => karate.appendTo(productNamesWeb, product.text.trim()))
    * match productNamesWeb == filteredProductNames