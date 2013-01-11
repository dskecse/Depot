Feature: User Manages Line Item
  Background:
    Given I am logged in as user

  @javascript
  Scenario: Decrement quantity of line items
    Given there is a product titled 'Programming Ruby'
    And I am at the store catalog
    And I press 'Add to Cart' 2 times
    When I follow '–'
    Then I should see '1× Programming Ruby'

  @javascript
  Scenario: Remove line item while decrementing the last
    Given there is a product titled 'Programming Ruby'
    And I am at the store catalog
    And I press 'Add to Cart'
    When I follow '–'
    Then I should not see '× Programming Ruby'

  @javascript
  Scenario: Remove line item with Destroy button
    Given there is a product titled 'Programming Ruby'
    And I am at the store catalog
    And I press 'Add to Cart' 2 times
    When I follow 'Destroy'
    Then I should not see 'Your Pragmatic Cart'
