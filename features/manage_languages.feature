Feature: Manage languages
  In order to manague languages
  As an user
  I want to create and update languages
  
  Scenario: Register new language
    Given I login
    And I am on the new language page
    When I fill in "Abbreviation" with "pt_BR"
    And I fill in "Name" with "Portuguese"
    And I press "Create"
    Then I should be on the edit language page
    And the "Abbreviation" field should contain "pt_BR"
    And the "Name" field should contain "Portuguese"
    And I should see "Language was successfully created."


  Scenario: Update a language
    Given I login
    And I have some languages
    And I am on the languages page
    When I edit the 2nd language
    Then I should be on the edit language page
    When I fill in "Name" with "portuguese"
    And I press "Update"
    Then I should be on the edit language page
    And I should see "Language was successfully updated."
    And the "Name" field should contain "portuguese"
