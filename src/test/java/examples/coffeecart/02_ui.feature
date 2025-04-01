Feature: Coffee cart UI

Scenario: Pure UI test
  * configure driver = { type: 'chrome' }
  * driver baseUrl
  * click("[data-test='Cappuccino']")
  * def checkoutButton = locate("[data-test='checkout']")
  * match checkoutButton.text == "Total: $19.00"
  * checkoutButton.click()
  * waitFor(".modal-content")
  * match text(".modal-content h1") == "Payment details"
  * screenshot()