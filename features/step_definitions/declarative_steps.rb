Given /^I create article (\d+)$/ do |num|
  steps %Q{
    When  I follow "New Article"
    And   I fill in "article_title" with "Title #{num}"
    And   I fill in "article[body_and_extended]" with "Contents of article #{num}"
    And   I press "Publish"
    Then  I should see "Article was successfully created"
  }
end

Given /^I add comment (\d+)$/ do |num|
  steps %Q{
    Given I fill in "comment_author" with "Author #{num}"
    And   I fill in "comment_body" with "Body of comment #{num}"
    Then  I press "comment"
    And   I should see "Body of comment #{num}"
  }
end

Given /^articles are added$/ do
  steps %Q{
    Given I am logged into the admin panel
    When  I create article 2
    And   I create article 3
    And   I follow "Log out"
    Then  I should see "Successfully logged out"
    When  I go to the home page
    And   I follow "Title 2"
    And   I add comment 1
    When  I go to the home page
    And   I follow "Title 3"
    And   I add comment 2
    When  I go to the home page
    And   I follow "Title 2"
    And   I add comment 3
    When  I am logged in as a publisher
    And   I create article 4
    Then  I should see "Title 4"
    And   I should see "Title 3"
    And   I should see "Title 2"
    And   I follow "Log out"
  }
end
