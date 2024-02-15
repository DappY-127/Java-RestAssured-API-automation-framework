Feature: API Testing for Automation Exercise

  Background:
    Given the base URL is "https://automationexercise.com/api"

  Scenario: Get All Products List
    When I send a GET request to "/productsList"
    Then the response code should be 200
    And the response should contain all products list

  Scenario: POST To All Products List
    When I send a POST request to "/productsList"
    Then the response code should be 405
    And the response message should be "This request method is not supported."

  Scenario: Get All Brands List
    When I send a GET request to "/brandsList"
    Then the response code should be 200
    And the response should contain all brands list

  Scenario: PUT To All Brands List
    When I send a PUT request to "/brandsList"
    Then the response code should be 405
    And the response message should be "This request method is not supported."

  Scenario Outline: POST To Search Product
    When I send a POST request to "/searchProduct" with search_product as "<search_term>"
    Then the response code should be 200
    And the response should contain searched products list

    Examples:
      | search_term |
      | top         |
      | tshirt      |
      | jean        |

  Scenario: POST To Search Product without search_product parameter
    When I send a POST request to "/searchProduct"
    Then the response code should be 400
    And the response message should be "Bad request, search_product parameter is missing in POST request."

  Scenario Outline: POST To Verify Login
    When I send a POST request to "/verifyLogin" with email "<email>" and password "<password>"
    Then the response code should be 200
    And the response message should be "User exists!"

    Examples:
      | email              | password |
      | valid@example.com  | password |

  Scenario: POST To Verify Login without email parameter
    When I send a POST request to "/verifyLogin" with password "password"
    Then the response code should be 400
    And the response message should be "Bad request, email or password parameter is missing in POST request."

  Scenario: DELETE To Verify Login
    When I send a DELETE request to "/verifyLogin"
    Then the response code should be 405
    And the response message should be "This request method is not supported."

  Scenario: POST To Verify Login with invalid details
    When I send a POST request to "/verifyLogin" with email "invalid@example.com" and password "invalid"
    Then the response code should be 404
    And the response message should be "User not found!"

  Scenario: POST To Create/Register User Account
    When I send a POST request to "/createAccount" with following details:
      | name    | email             | password | title | birth_date | birth_month | birth_year | firstname | lastname | company | address1 | address2 | country | zipcode | state | city | mobile_number |
      | John Doe| johndoe@example.com | password | Mr    | 01         | 01          | 1990       | John      | Doe      | ABC Ltd| Street 1| Street 2| USA     | 12345   | CA    | LA   | 1234567890    |
    Then the response code should be 201
    And the response message should be "User created!"

  Scenario: DELETE METHOD To Delete User Account
    When I send a DELETE request to "/deleteAccount" with email "johndoe@example.com" and password "password"
    Then the response code should be 200
    And the response message should be "Account deleted!"

  Scenario: PUT METHOD To Update User Account
    When I send a PUT request to "/updateAccount" with following details:
      | name    | email             | password | title | birth_date | birth_month | birth_year | firstname | lastname | company | address1 | address2 | country | zipcode | state | city | mobile_number |
      | John Doe| johndoe@example.com | password | Mr    | 01         | 01          | 1990       | John      | Doe      | ABC Ltd| Street 1| Street 2| USA     | 12345   | CA    | LA   | 1234567890    |
    Then the response code should be 200
    And the response message should be "User updated!"

  Scenario: GET user account detail by email
    When I send a GET request to "/getUserDetailByEmail" with email "johndoe@example.com"
    Then the response code should be 200
    And the response should contain user detail
