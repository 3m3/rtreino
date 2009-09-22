Feature: User sessions
  In order to manage user sessions
  As an registered user
  I want to login and logout
  
  Scenario: Login
    Given I am a registered user
    And I am on the homepage
    When I press "login" 
    Then I should be on login page
    When I login
    Then I should see "Login successful!"
