Feature: Coffee cart UI tests

  Scenario: Pure API test
    * url baseUrl
    * path 'list.json'
    * method get
    * def products = response
    * print products 
    * match products[0].name == "Espresso"
    * def onlyTheNames = $[*].name
    * print 'Product names', onlyTheNames

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

  Scenario: Mocked API
    * def startCoffeeMockServer = () => karate.start('mock.feature').port
    * def port = callonce startCoffeeMockServer
    * url 'http://localhost:' + port
    * path 'list.json'
    * method get
    * match responseStatus == 200
    * print response
    * path 'whatever'
    * method get
    * match responseStatus == 500

  Scenario: Mocked API and UI test
    * driver 'about:blank'
    * driver.intercept({ patterns: [{ urlPattern: '*/*.json' }], mock: 'mock.feature' })
    * driver baseUrl
    * click("[data-test='Brewtiful_morning']")
    * click("[data-test='Sip_happens']")
    * click('{}cart (2)')
    * waitForUrl('/cart')
    * match locate("[data-test='checkout']").text == "Total: $11.00"
    * screenshot()

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
