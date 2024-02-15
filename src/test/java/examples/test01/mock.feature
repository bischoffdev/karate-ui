@ignore
Feature: Coffee shop mock

Background:
  * configure cors = true
  * def products = 
  """
    [
    {
        "name": "Brewtiful morning",
        "price": 10,
        "recipe": [
            {
                "name": "espresso",
                "quantity": 100
            }
        ]
    },
    {
        "name": "Sip happens",
        "price": 12,
        "recipe": [
            {
                "name": "espresso",
                "quantity": 50
            },
            {
                "name": "milk foam",
                "quantity": 50
            }
        ]
    },
]
  """
  * json products = products

Scenario: pathMatches('/list.json') && methodIs('get')
  * def response = products

Scenario:
  * def responseStatus = 500