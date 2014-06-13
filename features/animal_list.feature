Feature: Animals list
  In order to know the animals that need a home
  The users
  Should be able to access a list of the animals registered in the system

Scenario: The user wants to see a list of every registered animal
  Given Some animals are registered in the system
  When I visit the home page
  Then I should see a link to a list of registered animals
  And if I click on the 'List of registered animals' list
  And I should see a list of every animal registered in the system

