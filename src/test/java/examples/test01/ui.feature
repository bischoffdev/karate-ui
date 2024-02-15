Feature: Coffee cart UI tests

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def baseUrl = 'https://coffee-cart.app/'

  Scenario: Pure UI test
    * driver baseUrl
    * screenshot()
    * click("[data-test='Cappuccino']")
    * def checkoutButton = locate("[data-test='checkout']")
    * match checkoutButton.text == "Total: $19.00"
    * click(checkoutButton)
    * waitFor(".modal-content")
    * screenshot()
 
  Scenario: API and UI test
    * url 'https://coffee-cart.app/list.json'
    * method get
    * def productNames = $[*].name
    * def filteredProductNames = productNames.filter(name => !name.startsWith("(Discounted)"))
    * driver baseUrl
    * waitFor('#app h4')
    * def productsWeb = locateAll('//h4/text()')
    * def productNamesWeb = []
    * productsWeb.forEach(e => karate.appendTo(productNamesWeb, e.text.trim()))
    * match productNamesWeb == filteredProductNames
