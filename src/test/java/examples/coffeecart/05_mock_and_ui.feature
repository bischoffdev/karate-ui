  Feature: Coffee cart mocked API and UI test
  
  Scenario: Mocked API and UI test
    * configure driver = { type: 'chrome' }
    * driver 'about:blank'
    * driver.intercept({ patterns: [{ urlPattern: '*/*.json' }], mock: 'mock.feature' })
    * driver baseUrl
    * screenshot()    
    * click("[data-test='Brewtiful_morning']")
    * click("[data-test='Sip_happens']")
    * click('{}cart (2)')
    * waitForUrl('/cart')
    * match locate("[data-test='checkout']").text == "Total: $11.00"
    * screenshot()