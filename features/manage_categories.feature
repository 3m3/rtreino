Feature: Manage categories
  In order to manager categories
  As an user
  I want create and manager categories
  
  Scenario: Register new category without parent
    Given I am a registred user
    And I am on the new category page
    When I fill in "Name" with "name 1"
    And I press "Create"
    Then I should see "name 1"
