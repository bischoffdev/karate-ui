@ignore
Feature:

Background:
  * configure cors = true

  # pathMatches('/list.json') && methodIs('get')
Scenario:
    * def response = read('products.json')
    
#Scenario:
#  * def responseStatus = 500