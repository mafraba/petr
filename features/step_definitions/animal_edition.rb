When(/^I visit the 'show animal' page for an animal I registered$/) do
  animal = @organisation.animals.first
  visit animal_path(animal)
end

When(/^I visit the 'show animal' page for an animal I didn't register$/) do
  animal = FactoryGirl.create(:another_animal)
  visit animal_path(animal)
end

Then(/^there should be a link to 'edit' the animal$/) do
  expect(page).to have_selector('#edit-animal-link')
end

Then(/^if I click on it I should be directed to the 'edit animal' page$/) do
  click_link 'edit-animal-link'
  expect(current_path).to eq(edit_animal_path(@organisation.animals.first))
end

Then(/^there should NOT be a link to 'edit' the animal$/) do
  expect(page).not_to have_selector('#edit-animal-link')
end