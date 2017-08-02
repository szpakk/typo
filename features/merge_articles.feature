Feature: Merge Articles
  As an administrator
  In order to reorganize written articles
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And   articles are added

  Scenario: Merge articles as a blog publisher
    Given I am logged in as a publisher
    And   I go to the edit article 5 page
    Then  I should not see "Merge Articles"

  Scenario: Merge articles as an admin
    Given I am logged into the admin panel
    And   I am on the edit article 3 page
    Then  I should see "Merge Articles"
    When  I fill in "merge_with" with "4"
    And   I press "Merge"
    Then  I should see "Articles successfully merged"
    And   I should see "Title 2"
    And   I should not see "Title 3"
    
  Scenario: Merge articles of different authors
    Given I am logged into the admin panel
    Then  I should see "Total posts: 4"
    And   I should see "Your posts: 3"
    When  I go to the edit article 3 page
    And   I fill in "merge_with" with "5"
    And   I press "Merge"
    When  I go to the dashboard page
    Then  I should see "Total posts: 3"
    And   I should see "Your posts: 3"
    
  Scenario: Contents of two articles are merged
    Given I am logged into the admin panel
    When  I go to the edit article 3 page
    And   I fill in "merge_with" with "4"
    And   I press "Merge"
    When  I go to the home page
    And   I follow "Title 2"
    Then  I should see "Contents of article 2"
    And   I should see "Contents of article 3"

  Scenario: Comments of two articles are merged
    Given I am logged into the admin panel
    When  I go to the edit article 3 page
    And   I fill in "merge_with" with "4"
    And   I press "Merge"
    When  I go to the home page
    And   I follow "Title 2"
    Then  I should see "Body of comment 1"
    And   I should see "Body of comment 2"
    And   I should see "Body of comment 3"