Feature: Front Page
  Scenario: See front page
    Given there is a visiter
    When I visit the home page
    Then I should see menu:
        | menu        |
        | Home        |
        | Company     |
        | Products    |
        | Int Market  |
        | Field       |
        | Equipments  |
        | Contact us  |
    And I should see content:
        | content            |
        | Video section      |
        | Recent Activities   |
        | Partners           |
        | Product Slide show |
        | News headlines     |