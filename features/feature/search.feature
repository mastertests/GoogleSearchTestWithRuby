# language: en

@feature
Feature: Result searching for search words

  Background: Open Google Search page
    Given I open main page

  Scenario: Google searching page should contain elements
    Then I should see element with "id" "hplogo"
    And I should see element with "class" "Fx4vi"
    And I should see element with "class" "fbar"

  Scenario: Search term results should contain term text in titles
    When I input "Cats" in search field
    And I press submit
    Then I should see "Cats" in search results