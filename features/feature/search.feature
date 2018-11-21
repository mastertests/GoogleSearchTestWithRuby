# language: en
@future
Feature: Result searching for search words

  Scenario: Check google searching page content
    Then I should see element with "id" "hplogo"
    And I should see element with "name" "btnK"
    And I should see element with "class" "Fx4vi"
    And I should see element with "class" "fbar"

  Scenario: Searching for search words
    When I input "Cats" in search field
    And I press submit
    Then I should see "Cats" in search result