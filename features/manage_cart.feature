Feature: Manage Cart
  Background:
    Given I am logged in as user

  @javascript
  Scenario: Quantity of the same product should be incremented
    Given there is a product titled 'Programming Ruby'
    And I am at the store catalog
    When I press 'Add to Cart' 2 times
    Then I should see '2× Programming Ruby'
