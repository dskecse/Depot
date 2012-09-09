Feature: Product Purchase
  In order to buy a product
  As a user
  I want to add a product to cart and checkout

  Background:
    Given I am logged in as a user

  @javascript
  Scenario: Adding Product to Cart
    Given there is a product titled 'Programming Ruby'
    And there is a payment type named 'Check'
    And I am at the store catalog
    When I press 'Add to Cart'
    Then I should see '1× Programming Ruby'
    And I follow 'Checkout'
    Then I should see 'Please Enter Your Details'
    When I fill in the following:
      | Name    | Ray W. Jones         |
      | Address | 123 Ocean Ave        |
      | Email   | customer@example.com |
    And I select 'Check' from 'Payment type'
    And I press 'Place Order'
    Then I should see 'Thank you for your order.'
    And I should have a mail confirmation on customer@example.com
