Feature: List of Organisations
  In order to know the organisations registered in the system and their work
  The users
  Should be able to access a list of all the organisations with links to their profile

Scenario: The user wants to see a list of organisations
  Given Some organisations are registered in the system
  When I visit the home page
  Then I should see a link to a 'List of Organisations'
  And I if I clink on that 'List of Organisations' link
  And I should see a list of every registered organisation