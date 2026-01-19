Feature: Coffee cart visual test

Scenario: Image comparison
    * configure driver = { type: 'chrome' }
    * driver baseUrl
    * driver.dimensions = { x: 0, y: 0, width: 1600, height: 1200 }
    * click("[data-test='Cappuccino']")
    * screenshot()
    * def boughtCoffee = screenshot()
    * compareImage { baseline: 'this:images/base.png', latest: #(boughtCoffee) }