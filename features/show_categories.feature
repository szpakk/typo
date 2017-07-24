Feature: Manage Categories
  As a blog administrator
  In order to organize my blog posts
  I want to be able to be able to see and add post categories
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
  
  Scenario: Display Categories page
    When I follow "Categories"
    Then I should see "Categories"
    And I should see "Keywords"
    
  Scenario: Create new category
    Given I am on the admin_categories page
    And I fill in "category_name" with "test"
    And I press "Save"
    Then I should see "Category was successfully saved."
    And I should see "test"

  Scenario: Edit category
    Given I am on the admin_categories page
    And   I should see "General"
    When  I follow "General"
    And   I fill in "category_permalink" with "general_edited"
    And   I press "Save"
    Then  I should see "Category was successfully saved."
    And   I should see "general_edited"
