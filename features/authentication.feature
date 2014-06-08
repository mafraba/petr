Feature: Authentication of users
  	In order to be authenticated as a registered organisations
  	The users
  	Should be able to signup, log in and out, reset password, and also allowed to edit
  	their data once they are logged in.

Scenario: The user is not logged in and visits the home page
	Given I am not logged in
  	When I visit the home page
  	Then I should see a 'Sign up' link
  	And I should see a 'Login' link

Scenario: The user is logged in and visits the home page
	Given I am logged in
  	When I visit the home page
  	Then I should see a 'Edit profile' link
  	And I should see a 'Logout' link

Scenario: The user should be able to sign up
	Given I am not logged in
  	When I click the 'Sign Up' link
  	And I fill my data
  	And I submit the signup form
  	Then I should have registered myself as an organisation
