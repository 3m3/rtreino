Feature: User sessions
  In order to manage user sessions
  As an registered user
  I want to login and logout
  
  Scenario: Login
    Given I am a registered user
    And I am on the homepage
    When I follow "Login" 
    Then I should be on login page
    When I login
    Then I should see "Login successful!"
    And I should see "Logout"

  Scenario: Logout
    Given I am logged in
    And I am on the homepage
    When I follow "Logout"
    Then I should be on the homepage
    And I should see "Login"
    And I should see "Register"
    And I should see "Succefully logged out."
