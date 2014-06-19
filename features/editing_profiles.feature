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
  Then My profile should be updated with my new name 'Cooler Name'

Scenario: An organisation tries to updates another's profile
  Given I am logged in as an organisation
  When I visit the 'edit profile' page for a profile that is not mine
  Then I should be redirected to the home page
  And I should see an error message 'Your are not allowed to access the page you requested'

Scenario: An individual tries to updates an organisation's profile
  Given I am NOT logged in as an organisation
  When I visit the 'edit profile' page for any organisation's profile
  Then I should be redirected to the home page
  And I should see an error message 'Your are not allowed to access the page you requested'