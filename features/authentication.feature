Feature: Authentication of users
  	In order to be authenticated as a registered organisations
  	The users
  	Should be able to signup, log in and out, reset password

Scenario: The user is not loged in and visits the home page
	Given I am not logged in
  	When I visit the home page
  	Then I should see a 'Sign up' link
  	And I should see a 'Login' link