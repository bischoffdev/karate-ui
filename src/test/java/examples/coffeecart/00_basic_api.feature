Feature: Basic API test

Scenario: Pure API test
    * url 'https://api.sampleapis.com/coffee/iced'
    * method get
    * print response
    * match responseStatus == 200