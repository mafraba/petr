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