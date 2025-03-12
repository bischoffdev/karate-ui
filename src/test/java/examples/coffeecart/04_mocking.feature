Feature: Coffee cart API mock

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