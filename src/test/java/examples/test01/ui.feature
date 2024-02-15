Feature: Coffee cart UI tests

  Background:
    * configure driver = { type: 'chrome' }
    * def baseUrl = 'https://coffee-cart.app/'

  Scenario: Pure UI test
    * driver baseUrl
    * screenshot()
    * click("[data-test='Cappuccino']")
    * waitFor("[data-test='checkout']")
    * def checkoutButton = locate("[data-test='checkout']")
    * def buttonText = checkoutButton.text
    * match checkoutButton.text == "Total: $19.00"
    * checkoutButton.click()
    * waitFor(".modal-content")
    * screenshot()
 
  Scenario: API and UI test
    * url baseUrl
    * path 'list.json'
    * method get
    * def productNames = $[*].name
    * def filteredProductNames = productNames.filter(name => !name.startsWith("(Discounted)"))
    * driver baseUrl
    * waitFor('#app h4')
    * def productsWeb = locateAll('//h4/text()')
    * def productNamesWeb = []
    * productsWeb.forEach(e => karate.appendTo(productNamesWeb, e.text.trim()))
    * match productNamesWeb == filteredProductNames

  Scenario: Mocked API
    * def start = () => karate.start('mock.feature').port
    * def port = callonce start
    * url 'http://localhost:' + port
    * path 'list.json'
    * method get
    * match responseStatus == 200
    * print response
    * path 'whatever'
    * method get
    * match responseStatus == 500

  Scenario: Mocked API and UI test
    * driver baseUrl
    * driver.intercept({ patterns: [{ urlPattern: '*' }], mock: 'mock.feature' })
    * screenshot()