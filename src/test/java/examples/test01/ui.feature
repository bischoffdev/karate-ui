Feature: Coffee cart UI tests

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    #* configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
    * def baseUrl = 'https://coffee-cart.app/'

  Scenario: Request coffee data
    * driver baseUrl