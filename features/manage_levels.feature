Feature: Manage levels
  In order to manager level
  As an user 
  I want add and update levels
  
  Scenario: Register new level
    Given I login
    And I am on the new level page
    When I fill in "Name" with "name 1"
    And I press "Create"
    Then I should be on the edit level page
    And I should see "Level was successfully created."
    And the "Name" field should contain "name 1"

  Scenario: Update a level
    Given I login
    And I have some levels
    And I am on the levels page
    When I edit the 2nd level
    Then I should be on the edit level page
    When I fill in "Name" with "name_test"
    And I press "Update"
    Then I should be on the edit level page
    And I should see "Level was successfully updated."
    And the "Name" field should contain "name_test"
