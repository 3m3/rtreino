Feature: Query to LiveArchive
  In order to know if a user get accept in a problem in LiveArchive
  As a coach
  I want search in LiveArchive for user's submissions
  
  Scenario: Get One submission from a specific user
    Given id with suffix = "22122QA"
    When I ask for the submissions
    Then I should get the first submission
