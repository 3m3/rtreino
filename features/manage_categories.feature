Feature: Manage categories
  In order to manager categories
  As an user
  I want create and manager categories
  
  Scenario: Register new category without parent
    Given I am a registered user
    And I login
    And I am on the new category page
    When I fill in "Name" with "name 1"
    And I press "Create"
    Then I should see "name 1"

  Scenario: Register new category with parent
    Given I login
    And I have some categories
    And I am on the new category page
    When I fill in "Name" with "name 1"
    And I select the first category from "Category"
    And I press "Create"
    Then I should be on the edit category page
    And I should see "Category was successfully created."
    And the "Name" field should contain "name 1"
    And first category should be selected from "Category"

