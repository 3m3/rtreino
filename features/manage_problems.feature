Feature: Manage problems
  In order to manage problems
  The user
  wants create and edit problems
  
  Scenario: Register new problem
    Given I am on the new problem page
    When I fill in "Code" with "code 1"
    And I fill in "Name" with "name 1"
    And I fill in "Source" with "source 1"
    And I press "Create"
    Then I should see "code 1"
    And I should see "name 1"
    And I should see "source 1"

  Scenario: Register new problem with category and level
    Given the following categories:
      |id|name|
      |1|Graph|
    Given the following levels:
      |description|difficult_value|
      |easy       |0| 
      |hard       |1| 
    Given I am on the new problem page
    When I fill in "Code" with "code 1"
    And I fill in "Name" with "name 1"
    And I fill in "Source" with "source 1"
    And I press "Create"
    And I should see "(none)"
    And I follow "Edit"
    Then I select "Graph" from "problem_category_id"
    And I select "hard" from "Level"
    And I press "Update"
    And I should see "code 1"
    And I should see "name 1"
    And I should see "source 1"
    And I should see "Graph"
    And I should see "hard"
    Then I follow "Edit"
    And "Graph" should be selected for "Category"

  Scenario: Delete problem
    Given the following problems:
      |code|name|source|
      |code 1|name 1|source 1|
      |code 2|name 2|source 2|
      |code 3|name 3|source 3|
      |code 4|name 4|source 4|
    When I delete the 3rd problem
    Then I should see the following problems:
      |Code|Name|Source|
      |code 1|name 1|source 1|
      |code 2|name 2|source 2|
      |code 4|name 4|source 4|
