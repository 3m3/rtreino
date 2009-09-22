Feature: Manage problems
  In order to manage problems
  The user
  wants create and edit problems
  
  @pending Scenario: Register new problem
    Pending
    Given I am on the new problem page
    When I fill in "Code" with "code 1"
    And I fill in "Name" with "name 1"
    And I fill in "Source" with "source 1"
    And I press "Create"
    Then I should see "code 1"
    And I should see "name 1"
    And I should see "source 1"

  @pending Scenario: Register new problem with category and level
    Pending
    Given the following categories:
      |name  |
      |Graph |
      |Ad-hoc|
    Given the following levels:
      |description|difficult_value|
      |easy       |0| 
      |hard       |1| 
    Given I am on the new problem page
    When I fill in "Code" with "code 1"
    And I fill in "Name" with "name 1"
    And I fill in "Source" with "source 1"
    And I press "Create"
    And I follow "edit"
    And I select "Graph" from "Category"
    And I press "Add category"
    And I select "hard" from "Level"
    And I press "Update"
    Then I should see "Graph"
    And I follow "edit"
    When I select "Ad-hoc" from "Category"
    And I press "Add category"
    And I press "Update"
    Then I should see "code 1"
    And I should see "name 1"
    And I should see "source 1"
    And I should see "Graph"
    And I should see "Ad-hoc"
    And I should see "hard"
    When I follow edit "Edit"
    And I delete the "Graph" from "Category"
    And I press "Update"
    Then I should not see "Graph"
    And I should see "Ad-hoc"

  @pending Scenario: Delete problem
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
