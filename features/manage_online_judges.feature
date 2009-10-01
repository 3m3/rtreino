Feature: Manage online judges
  In order to manage online judges
  The user
  wants create and update online judges
  
  Scenario: Register new online_judge
    Given I login
    And I am on the new online judge page
    When I fill in "Name" with "name 1"
    And I fill in "Webpage" with "webpage 1"
    And I press "Create"
    Then I should see "name 1"
    And I should see "webpage 1"

  Scenario: Delete online_judge
    Given I login
    And the following online_judges:
      |name|webpage|
      |name 1|webpage 1|
      |name 2|webpage 2|
      |name 3|webpage 3|
      |name 4|webpage 4|
    When I delete the 3rd online_judge
    Then I should see the following online_judges:
      |Name|Webpage|
      |name 1|webpage 1|
      |name 2|webpage 2|
      |name 3|webpage 3|
