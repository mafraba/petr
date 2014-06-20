Feature: Registration of animals
  The organisations
  Should be able to register animals
  So that everyone can see them (and maybe adopt them)

Scenario: An organisation should see a link to register an animal
  Given I am logged in as an organisation
  When I visit the home page
  Then I should see a link to register an animal

Scenario: An individual should NOT see a link to register an animal
  Given I am not logged in as an organisation
  When I visit the home page
  Then I should not see a link to register an animal  

Scenario: An organisation should be able to register an animal
  Given I am logged in as an organisation
  When I visit the home page
  And I click the link to register an animal
  And I fill in and submit the necessary animal's data
  Then the animal gets registered in the system

Scenario: An organisation should be able to edit their animals info
  Given I am logged in as an organisation
  When I visit the list of animals
  And I click on the 'edit' link of an animal I registered
  Then I should see the 'edit animal' page
  And if I change its name to 'Cooler Name' and submit
  Then I should see the 'show animal' page where name is 'Cooler Name'

Scenario: An organisation should NOT be able to edit animals of other organisations
  Given I am logged in as an organisation
  When I visit a url to edit an animal I didn't register
  Then I should be redirected to the home page and see an error message

Scenario: A visitor should NOT be able to edit animals
  Given I am not logged in
  When I visit a url to edit an animal
  Then I should be redirected to the home page and see an error message
