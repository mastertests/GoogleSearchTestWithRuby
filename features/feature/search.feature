# language: en
@feature
Feature: Result searching for search words

  Background: Open Google Search page
    Given I open main page

  Scenario Outline: Google searching page should contain elements
    Then I should see element with "<locator_type>" "<locator>"
    Examples: Elements with locator type
      | locator_type | locator |
      | id           | hplogo  |
      | class        | Fx4vi   |
      | class        | fbar    |

  Scenario Outline: Search term results should contain term text in titles
    When I input "<search_term>" in search field
    And I press submit
    Then I should see "<search_term>" in search results
    Examples: Search terms words
      | search_term |
      | Cats        |
      | Dogs        |