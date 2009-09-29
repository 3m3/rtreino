Feature: Manage analyses
  In order to manage 
  The user
  wants create and edit analyses
  
  Scenario: Register new analysis
    Given I login
    And I am on the show page of problem with code TEST
    When I follow "New analysis"
    Then I should be on the new analysis of problem page
    When I fill in "Body" with "body 1"
    And I press "Create"
    Then I should be on the problem analysis page
    
  Scenario: Register new analysis and continue editing
    Given I login
    And I am on the show page of problem with code TEST
    When I follow "New analysis"
    Then I should be on the new analysis of problem page
    When I fill in "Body" with "body 1"
    And I press "Create and continue"
    Then I should be on the edit problem analysis page

  Scenario: Edit some analysis
    Given I login
    And I am on the edit my analysis of problem page
    When I fill in "Body" with "body 2"
    And I press "Update"
    Then I should be on the problem analysis page

  Scenario: Edit some analysis
    Given I login
    And I am on the edit my analysis of problem page
    When I fill in "Body" with "body 2"
    And I press "Update and continue"
    Then I should be on the edit problem analysis page
