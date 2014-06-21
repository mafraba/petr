Feature: Animals edition
  In order stop disseminating animals already adopted
  The organisations
  Should be able to remove from the system the animals they had registered

Scenario: An organisation should see links to delete their animals 
  Given I am logged in as an organisation
  When I visit the 'show animal' page for an animal I registered
  Then there should be a button to 'delete' the animal
  And if I click on it the animal should be removed from the system

# Scenario: An organisation should not see links to edit other's animals 
#   Given I am logged in as an organisation
#   When I visit the 'show animal' page for an animal I didn't register
#   Then there should NOT be a link to 'edit' the animal

# Scenario: An individual should not see links to edit animals 
#   Given I am not logged in as an organisation
#   When I visit the 'show animal' page for any animal
#   Then there should NOT be a link to 'edit' the animal

# Scenario: An organisation should be able to edit their animals info
#   Given I am logged in as an organisation
#   When I visit the 'edit animal' page for an animal I registered
#   And I change its name to 'Cooler Name' and submit
#   Then the animal's name should now be 'Cooler Name'

# Scenario: An organisation should NOT be able to edit animals of other organisations
#   Given I am logged in as an organisation
#   When I visit the 'edit animal' page for an animal I didn't register
#   Then I should be redirected to the home page and see an error message

# Scenario: A visitor should NOT be able to edit animals
#   Given I am not logged in
#   When I visit the 'edit animal' page for any animal
#   Then I should be redirected to the home page and see an error message