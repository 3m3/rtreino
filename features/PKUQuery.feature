Feature: Query to PKU
  In order to know if a user get accept in a problem in PKU
  As a coach
  I want search in PKU for user's submissions
  
  Scenario: Get One submission from a specific user
    Given user = "rtreino"
    When I ask for the submissions
    Then I should get the first submission
    
  Scenario: Get Two submissions from a specific user
    Given user = "rtreino"
    When I ask for the submissions
    Then I should get the first and the second submission
    
  Scenario: User has no submissions
    Given user = "rtreinovazio"
    When I ask for the submissions
    Then I should not get any submission
    
  Scenario: User has more submissions than page limite
    Given user = "rtreino"
    When I ask for the submissions
    Then I should get the first submission from the second page

  Scenario: Get newer submissions than a specific submission from a specific user 
    Given user = "rtreino" and submission with run_id = "5747447"
    When I ask for the newer submissions
    Then I should get some submissions with run_ids bigger 
