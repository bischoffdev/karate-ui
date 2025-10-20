Feature: Basic API test

Scenario: Pure API test
    * url 'https://api.sampleapis.com/futurama/info'
    * method get
    * print response
    * match responseStatus == 200