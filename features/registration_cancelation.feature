Feature: Cancel an organisation's registration
  The organisations
  Should be able to cancel their registration

Scenario: An organisation can see a a button to manage its account
  Given I am logged in as an organisation
  When I visit the home page
  Then I should see a link to manage my account
  And if I click on 'Manage account'
  Then I should get to the account management page

Scenario: An organisation can see a a button to cancel its account
  Given I am logged in as an organisation
  When I visit the account management page
  Then I should see a button named 'Cancel my account'

Scenario: An organisation can cancel its account
  Given I am logged in as an organisation
  And I have animals registered
  When I visit the account management page
  And I click on 'Cancel my account' and confirm
  Then I should be gone from the system along with my animals

