Feature: Authentication of organisations
  	In order to be authenticated as a registered organisations
  	The organisations
  	Should be able to signup, log in and out, reset password, and also allowed to edit
  	their data once they are logged in.

Scenario: The organisation is not logged in and visits the home page
	Given I am not logged in
  	When I visit the home page
  	Then I should see a 'Sign up' link
  	And I should see a 'Login' link

Scenario: The organisation is logged in and visits the home page
	Given I am logged in
  	When I visit the home page
  	Then I should see a 'Edit profile' link
  	And I should see a 'Logout' link

Scenario: The organisation should be able to sign up
	Given I am not logged in
  	When I click the 'Sign Up' link
  	And I fill my data
  	And I submit the signup form
  	Then I should have registered myself as an organisation

Scenario: The organisation forgets its password
	Given I am not logged in
	But I am a registered user
  	When I click the 'Login' link
  	And I click the 'Password forgotten' link
  	And I fill in my email
  	And I push the 'Send me reset password instructions' button
  	Then I should be sent an email with instructions
