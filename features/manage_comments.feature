Feature: Manage comments
  In order to manage 
  The user
  wants create and edit comments
  
  Scenario: Register new comment in a analysis
    Given I login
    And I am on the show page of some problem that has only one analysis
    When I follow "Show"
    And I follow "Comment"
    Then I should be on the new comment of analysis page
    When I fill in "Body" with "body 1"
    And I press "Create"
    Then I should be on the problem analysis page

  Scenario: Edit some comment from analysis
    Given I login
    And I am on the show page of some problem that has only one analysis that I commented
    When I follow "Show"
    And I follow "Edit" within "#comments"
    And I fill in "Body" with "body 2"
    And I press "Update"
    Then I should be on the problem analysis page

  Scenario: Edit some analysis from other user and I like admin
    Given I login as admin
    And I am on the show page of some problem that has only one analysis with one comment
    When I follow "Show"
    And I follow "Edit" within "#comments"
    And I fill in "Body" with "body 2"
    And I press "Update"
    Then I should be on the problem analysis page

  Scenario: Register new reply
    Given I login
    And I am on the show page of some problem that has only one analysis with one comment
    And I follow "Show"
    And I follow "Reply"
    Then I should be on the new comment of comment page
    When I fill in "Body" with "body 1"
    And I press "Create"
    Then I should be on the problem analysis page
