Feature: Authenticate
  In order to control access
  As a random guy
  I want to have a session control

  Scenario: User create
    Given I am on "the homepage"
    When I follow "Create user"
    And I fill in "username" with "atol"
    And I fill in "password" with "ovodebarata"
    And I fill in "password_confirmation" with "ovodebarata"
    And I fill in "email" with "atol@linux.ime.usp.br"
    And I press "Create"
    Then I should see "User created"
    

  
 
