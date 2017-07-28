Feature: Merge Articles
  As an administrator
  In order to reorganize written articles
  I want to be able to merge articles

  Background:
    Given the blog is set up

  Scenario: Merge articles as a blog publisher
    Given I am logged in as a publisher
    And   I go to the edit article 1 page
    Then  I should not see "Merge Articles"

  Scenario: Merge articles as an admin
    Given I am logged into the admin panel
    And   I am on the edit article 1 page
    Then  I should see "Merge Articles"
    # When  I fill in "merge_with" with "3"
    # And   I click on "Merge"
    
  Scenario: Merge articles of different authors
