Feature: Editing an organisation's profile
  In order to know keep their profile updated
  The organisations
  Should be able to edit their profile's info

Scenario: The organisation updates its profile
  Given I am logged in as an organisation
  When I visit the home page
  Then I should see a link to edit my profile
  And if I click on the 'Edit profile' link
  And I update my name to 'Cooler Name'
  Then I should see my profile updated with my new name 'Cooler Name'
