Feature: Manage dashboard
  In order to manage dashboard
  As an user
  wants view all expected infos in dashboard
  
  Scenario: Enter in dashboard with problem created and updated
    Given I login
    And I created a problem with code TEST
    And I updated a problem with code TEST
    And I am on the dashboard page
    Then I should see "Created a problem with code TEST"
    And I should see "Updated a problem with code TEST"
    When I follow "Created a problem with code TEST"
    Then I should be on the problem page
    And I should see "TEST"

  Scenario: Enter in dashboard with analysis created and updated
    Given I login
    And I created a analysis to problem TEST
    And I updated a analysis to problem TEST
    And I am on the dashboard page
    Then I should see "User created an analysis for problem TEST"
    And I should see "User updated his analysis from problem TEST"
    When I follow "User updated his analysis from problem TEST"
    Then I should be on the problem analysis page
    And I should see "by User"
