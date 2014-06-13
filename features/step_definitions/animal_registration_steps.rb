When(/^I click the link to register an animal$/) do
  click_link 'animal-registration-link'
end

When(/^I fill in and submit the necessary animal's data$/) do  
  fill_in "animal_name", :with => "Chispa"
  fill_in "animal_sex", :with => "male"
  fill_in "animal_description", :with => "Guau guau"
  select '2010', :from => 'animal_birthdate_1i'
  select 'May', :from => 'animal_birthdate_2i'
  select '11', :from => 'animal_birthdate_3i'  

  click_button "Save"
end

Then(/^the animal gets registered in the system$/) do
  expect(Animal).to exist(name: 'Chispa')
end

Then(/^I should see a link to register an animal$/) do
  expect(page).to have_selector('#animal-registration-link')
end

Then(/^I should not see a link to register an animal$/) do
  expect(page).to_not have_selector('#animal-registration-link')
end