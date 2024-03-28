@ignore
Feature: Mocking coffee products

Background:
    * configure cors = true
   
Scenario: pathMatches('/list.json') && methodIs('get')
    * json response = read('products.json')

Scenario:
    * def responseStatus = 500