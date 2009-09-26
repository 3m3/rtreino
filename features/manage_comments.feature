Feature: Manage comments
  In order to manage 
  The user
  wants create and edit comments
  
  Scenario: Register new comment in a analysis
    Given I login
    And I am on the edit page of some problem that has only one analysis
    When I follow "Comment"
    Then I should be on the new comment of analysis page
    When I fill in "Body" with "body 1"
    And I press "Create"
    Then I should be on the edit problem page

  Scenario: Edit some comment from analysis
    Given I login
    And I am on the edit page of some problem that has only one analysis that I commented
    When I follow "Edit" within "#analyses // #comments"
    When I fill in "Body" with "body 2"
    And I press "Update"
    Then I should be on the edit problem page

  Scenario: Edit some analysis from other user and I like admin
    Given I login as admin
    And I am on the edit page of some problem that has only one analysis with one comment
    When I follow "Edit" within "#analyses // #comments"
    And I fill in "Body" with "body 2"
    And I press "Update"
    Then I should be on the edit problem page

  Scenario: Register new reply
    Given I login
    And I am on the edit page of some problem that has only one analysis with one comment
    When I follow "Reply"
    Then I should be on the new comment of comment page
    When I fill in "Body" with "body 1"
    And I press "Create"
    Then I should be on the edit problem page
