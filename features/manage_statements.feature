Feature: Manage statements
  In order to manage 
  The user
  wants create and edit statements
  
  Scenario: Register new statement and I press create
    Given I login
    And I have some problems
    And I have some languages
    And I am on the edit page of some problem
    When I follow "New statement"
    Then I should be on the new statement of problem page
    When I select the first language from "Language"
    And I fill in "Body" with "body 1"
    And I press "Create"
    Then I should be on the problem page

  Scenario: Register new statement and press Create and Continue
    Given I login
    And I have some problems
    And I have some languages
    And I am on the edit page of some problem
    When I follow "New statement"
    Then I should be on the new statement of problem page
    When I select the first language from "Language"
    And I fill in "Body" with "body 1"
    And I press "Create and continue"
    Then I should be on the edit problem statement page


  Scenario: Edit some statement
    Given I login
    And I am on the edit statement of problem page
    When I fill in "Body" with "body 2"
    And I press "Update"
    Then I should be on the problem page

  Scenario: Edit some statement and continuing edit
    Given I login
    And I am on the edit statement of problem page
    When I fill in "Body" with "body 2"
    And I press "Update and continue"
    Then I should be on the edit problem statement page
