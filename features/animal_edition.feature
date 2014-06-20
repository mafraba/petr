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