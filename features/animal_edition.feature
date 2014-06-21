Feature: Animals edition
  In order to amend mistakes and keep them uptodate
  The organisations
  Should be able to edit the animals they registered in the system

Scenario: An organisation should see links to edit their animals 
  Given I am logged in as an organisation
  When I visit the 'show animal' page for an animal I registered
  Then there should be a link to 'edit' the animal
  And if I click on it I should be directed to the 'edit animal' page

Scenario: An organisation should not see links to edit other's animals 
  Given I am logged in as an organisation
  When I visit the 'show animal' page for an animal I didn't register
  Then there should NOT be a link to 'edit' the animal

Scenario: An individual should not see links to edit animals 
  Given I am not logged in as an organisation
  When I visit the 'show animal' page for any animal
  Then there should NOT be a link to 'edit' the animal

Scenario: An organisation should be able to edit their animals info
  Given I am logged in as an organisation
  When I visit the 'edit animal' page for an animal I registered
  And I change its name to 'Cooler Name' and submit
  Then the animal's name should now be 'Cooler Name'

Scenario: An organisation should NOT be able to edit animals of other organisations
  Given I am logged in as an organisation
  When I visit the 'edit animal' page for an animal I didn't register
  Then I should be redirected to the home page and see an error message

Scenario: A visitor should NOT be able to edit animals
  Given I am not logged in
  When I visit the 'edit animal' page for any animal
  Then I should be redirected to the home page and see an error message