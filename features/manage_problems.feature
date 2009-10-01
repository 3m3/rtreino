Feature: Manage problems
  In order to manage problems
  The user
  wants create and edit problems
  
  Scenario: Register new problem
    Given I login
    And I am on the new problem page
    When I fill in "CODE" with "TEST"
    And I fill in "Name" with "name 1"
    And I fill in "Source" with "source 1"
    And I choose "Math"
    And I press "Create"
    Then I should be on the edit problem page
    And the fields in following should contain:
      |CODE|TEST|
      |Name|name 1|
      |Source|source 1|

  Scenario: Register new problem with category and level
    Pending
    Given the following categories:
      |name  |
      |Graph |
      |Ad-hoc|
    Given the following levels:
      |name|
      |easy|
      |hard|
    Given I login
    And I am on the new problem page
    When I fill in "CODE" with "TEST"
    And I fill in "Name" with "name 1"
    And I fill in "Source" with "source 1"
    And I check "Graph"
    And I choose "Programming"
    And I press "Create"
    Then I should be on the edit problem page
    When I select "hard" from "Level"
    And I press "Update"
    Then I should be on the edit problem page
    And the fields in following should contain:
      |CODE|TEST|
      |Name|name 1|
      |Source|source 1|
