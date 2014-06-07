Feature: System's home page
  In order to know about the whole purpose of the system
  The users
  Should be able to see an overview/description of what the system does and what are its main goals

Scenario: The user visits the home page
  When I visit the home page
  Then I should see a welcome message
  And I should see a description of the system's main purposes
  And I should see what the system offers to individuals
  And I should see what the system offers to organizations