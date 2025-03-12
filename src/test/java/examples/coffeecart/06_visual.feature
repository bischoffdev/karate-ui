
Feature: Coffee cart visual test

Scenario: Image comparison
    * configure imageComparison = { mismatchShouldPass: true }
    * driver baseUrl
    * click("[data-test='Cappuccino']")
    * def boughtCoffee = screenshot()
    * compareImage { baseline: 'this:images/base.png', latest: #(boughtCoffee) }     

    











    # * def options = """
    #   {        
    #   }
    # """
    # * compareImage { baseline: 'this:images/base.png', latest: #(boughtCoffee), options: #(options) }
    # * submit().click('{}cart (2)')
    # * delay(10000)
  