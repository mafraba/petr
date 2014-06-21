When(/^I visit the 'show animal' page for an animal I registered$/) do
  animal = @organisation.animals.first
  visit animal_path(animal)
end

When(/^I visit the 'show animal' page for an animal I didn't register$/) do
  animal = FactoryGirl.create(:another_animal)
  visit animal_path(animal)
end

When(/^I visit the 'show animal' page for any animal$/) do
  animal = FactoryGirl.create(:animal)
  visit animal_path(animal)
end

When(/^I visit the 'edit animal' page for an animal I didn't register$/) do
  animal = FactoryGirl.create(:another_animal)
  visit edit_animal_path(animal)
end

Then(/^there should be a (link|button) to '(.+)' the animal$/) do |type, action|
  expect(page).to have_selector("##{action}-animal-#{type}")
end

Then(/^if I click on it I should be directed to the 'edit animal' page$/) do
  click_link 'edit-animal-link'
  expect(current_path).to eq(edit_animal_path(@organisation.animals.first))
end

Then(/^there should NOT be a link to 'edit' the animal$/) do
  expect(page).not_to have_selector('#edit-animal-link')
end

When(/^I visit the 'edit animal' page for an animal I registered$/) do
  visit edit_animal_path(@organisation.animals.first)
end

When(/^I change its name to '(.+)' and submit$/) do |new_name|
  fill_in "animal_name", with: new_name
  click_button "Save"
end

Then(/^the animal's name should now be '(.+)'$/) do |new_name|
  animal = Animal.find(@organisation.animals.first.id)
  expect(animal.name).to eq(new_name)
end

Then(/^I should be redirected to the home page and see an error message$/) do
  expect(current_path).to eq(root_path)
  expect(page).to have_content('not authorized')
end

When(/^I visit the 'edit animal' page for any animal$/) do
  animal = FactoryGirl.create(:animal)
  visit edit_animal_path(animal)
end