Feature: Coffee cart visual test

Scenario: Image comparison
    * configure driver = { type: 'chrome', addOptions: ['--window-size=1600,1200'] }
    * driver baseUrl
    * click("[data-test='Cappuccino']")
    * def boughtCoffee = screenshot()
    * compareImage { baseline: 'this:images/base.png', latest: #(boughtCoffee) }